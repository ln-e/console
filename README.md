Console component
=================

A component that facilitates the creation of console commands in Parser3.

Installation
------------

The preferred method of installation is throw [parsekit](//github.com/ln-e/parsekit)

```shell
    parsekit require ln-e/console
```

Do not forget to use vault/classpath.p in auto.p
```parser3
    ^use[./vault/classpath.p]
```

Usage
-----

Create application and configure commands

```parser3
    $app[^Application::create[]]
    ^app.register[^SomeCommand::create[]]
    ^app.register[^SomeOtherCommand::create[]]
    $result[$result^app.run[]]
```


Or you can extend Application class and implement loading commands as you need.
I.e. load all *Command.p files in some directory:

```parser3
    @CLASS
    Application

    @OPTIONS
    locals

    @auto[]
        $Application:options[^hash::create[]]
    ###

    #------------------------------------------------------------------------------
    #Configures list of available commands
    #------------------------------------------------------------------------------
    @configureCommands[][result]
    #   implement getting available commands such as
        $files[^file:list[./Commands/;\sCommand.p]]
        ^files.menu{
            ^self.register[^reflection::create[^list.replace[.p;];create]]
        }
    ###
```

