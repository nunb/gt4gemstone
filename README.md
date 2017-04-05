# gt4gemstone [![Build Status](https://travis-ci.org/feenkcom/gt4gemstone.png?branch=master)](https://travis-ci.org/feenkcom/gt4gemstone)
gt4gemstone is the Glamorous Toolkit for remote work with Gemstone/S. It is a project developed by feenk.com.

## Installation

The gt4gemstone tools require code to be installed both on the client and on the server images.
To create a new client containing the latest version, after installing [GsDevKit](https://github.com/GsDevKit/GsDevKit_home#installation), do the following from the $GS_HOME folder:

    cd $GS_HOME/shared/repos
    git clone https://github.com/feenkcom/gt4gemstone.git
    createClient -t pharo Gt4Gemstone -l -v Pharo5.0 -z $GS_HOME/shared/repos/gt4gemstone/.smalltalk.ston
    startClient Gt4Gemstone -s Gt4Gemstone

For creating a new stone containing the latest version use:

    createStone -u http://ws.stfx.eu/4TIV0I28KZ6O?format=text -i Gt4Gemstone -l Gt4Gemstone Gt4Gemstone 3.3.3

In a stone where GsDevKit is present the server code can be installed with tODE using this the specification at https://raw.githubusercontent.com/feenkcom/gt4gemstone/master/.smalltalk.ston.

For installing the gt4gemstone in a stone that does not require GsDevKit see [gt4gemstone server instalation without GsDevKit](doc/bareGemStoneInstallation.md). For installing and configuring GsDevKit on Windows see [GsDevKit Windows Installation](doc/windowsGsDevKitInstallation.md)

## Connecting to a stone

gt4gemstone comes with a session manager that can be opened from the World menu. This manager allows you to create connections to stones based on session descriptions. By default it uses the session descriptions present in the GsDevKit installation.

<img src="doc/gemstone-sessions-handler.png"/>

## Remote Playground

A remote Pharo Playgrond that works on a remote stone is created using the context menu of a selected session. This playground has a distinct blue border and provides actions for executing and inspecting code remotely.

<img src="doc/gemstone-session-handler-remote-playground.png">

<img src="doc/gemstone-playground.png">

Alternatively opening a Pharo Playground can be achived using the following API:

    gtClient := GtGsMinimalClient forDefaultSessionDescription.
    gsPlayground := (GtGsPlayground forGemstoneClient: gtClient).
    gsPlayground openEmpty.
    
## Inspecting objects

gt4gemstone further comes with a moldable inspector that allows you to inspect objects using multiple presentations.
    
<img src="doc/raw-inspector.png"/>

<img src="doc/dictionary-inspector.png"/>

<img src="doc/custom-inspector.png"/>

<img src="doc/string-inspector.png"/>
    
## Debugger

<img src="doc/basic-debugger.png"/>


## Utility scripts

Updating the code of gt4gemstone in a Gemstone stone:

    gtClient := GtGsMinimalClient forSessionDescriptionNamed: SCIGemStoneServerConfigSpec defaultSessionName.
    gtClient evaluateCommandStream: 'project load Gt4Gemstone' readStream .
    gtClient evaluateCommandStream: 'commit' readStream.

Evaluating and inspecting a remote command:

    gtClient performStringRemotelyAndInspect: '40+2'.

Triggering a debugger:

    self halt. GtGsDebuggingPlaygroundTests new methodWithPrintStringInBlock
