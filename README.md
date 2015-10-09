Command line interface for Giant
================================

Collection of command line tools for managing Giant-based projects (including Giant itself).

Installation
------------

    npm install -g giant-cli

Usage
-----

Building a module

    giant build <moduleName>
    
Building all modules

    giant build
    
(Expects the file `module-sequence.dat` to be present at the root of the project.)

Clearing all modules (removing results of build)

    giant clear
    
Running command for a specific module

    giant run <moduleName> "<command>"
    
Running a command for all modules

    giant batch "<command>"
