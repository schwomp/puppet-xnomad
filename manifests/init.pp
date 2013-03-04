# Install Xnomad.app into /Applications

class xnomad {
  package { 'Xnomad':
    provider => 'compressed_app',
    source   => 'http://klaud.tazj.in/NJTW/download/Xnomad.zip'
  }
  package { 'Shadowkiller':
    provider => 'appdmg',
    source   => 'http://www.unsanity.net/shadowkiller-13.dmg'
  }

  file { "/Users/${::boxen_user}/.xnomad":
    source   => 'puppet:///modules/xnomad/.xnomad'
  }

  # Enable access for assistive devices
  file { '/var/db/.AccessibilityAPIEnabled':
    content => 'a',
    owner   => 'root',
    group   => 'wheel',
    mode    => '0444',
  }

  # Replace rounded corners on 10.8.2 (untested on others)
  if $::macosx_productversion == '10.8.2' {
    file { '/System/Library/PrivateFrameworks/CoreUI.framework/Versions/A/Resources/ArtFile.bin':
      source => 'puppet:///modules/xnomad/ArtFile.bin'
    }

    file { '/System/Library/PrivateFrameworks/CoreUI.framework/Versions/A/Resources/SArtFile.bin':
      source => 'puppet:///modules/xnomad/SArtFile.bin'
    }
  }

  file { '/var/db/.AccessibilityAPIEnabled':
    content => 'a',
    owner   => 'root',
    group   => 'wheel',
    mode    => '0444',
  }

  osx_login_item { 'Xnomad':
    path     => '/Applications/Xnomad.app',
    require  => [File["/Users/${::boxen_user}/.xnomad"], File['/var/db/.AccessibilityAPIEnabled']]
  }
  osx_login_item { 'Shadowkiller':
    path     => '/Applications/Shadowkiller.app'
  }

}
