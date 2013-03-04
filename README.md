# Xnomad Puppet Module for Boxen

This module installs Xnomad on OS X (only tested on 10.8.2). This will also replace your ArtFile with an ArtFile that disables rounded corners and will also install an application named Shadowkiller which disables the OS X window shadows.
Both Xnomad.app and Shadowkiller.app are executed at Startup to get the desired effect. An example configuration file for Xnomad will be placed in ~/.xnomad - all keybindings in there can be edited at will but require a restart of Xnomad.app (can be killed through Activity Monitor).

## Usage

`include xnomad`

## Required Puppet Modules

* `boxen`

## Credits

* [Xnomad](http://github.com/fjolnir/xnomad)
* [Shadowkiller](http://www.unsanity.com/haxies/shadowkiller)
* Credits for the ArtFiles that remove rounded corners also go to [fjolnir](http://github.com/fjolnir)!