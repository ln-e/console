# Created by IntelliJ IDEA.
# User: ibodnar
# Date: 13.02.16
# Time: 19:38
# To change this template use File | Settings | File Templates.

@CLASS
Ln-e/Console/Application

@OPTIONS
locals

@auto[]
###


#-----------------------------------------------------------------------------
#:constructor
#-----------------------------------------------------------------------------
@create[]
    $self.options[^hash::create[]]
    $self.commands[^hash::create[]]
    ^configureCommands[]
###


#-----------------------------------------------------------------------------
#Configures predefined list of available commands
#-----------------------------------------------------------------------------
@configureCommands[]
###


#-----------------------------------------------------------------------------
#Add one command to the list of available commands
#
#:param command type CommandInterface
#-----------------------------------------------------------------------------
@registerCommand[command]
    ^command.configure[]
    $self.commands.[$command.name][$command]
###


#-----------------------------------------------------------------------------
#Check whatever command exists
#
#:param commandName type string Name of the command to check
#
#:result bool
#-----------------------------------------------------------------------------
@hasCommand[commandName][result]
    $result[^commands.contains[$commandName]]
###


#-----------------------------------------------------------------------------
#Starts application
#
#:param input type Ln-e/Console/Input/InputInterface
#:param output type Ln-e/Console/Output/OutputInterface
#
#:result string
#-----------------------------------------------------------------------------
@run[input;output][result]
    ^if(!def $input){
        $input[^Ln-e/Console/Input/ArgvInput::create[]]
    }
    ^if(!def $output){
        $output[^Ln-e/Console/Output/ConsoleOutput::create[]]
    }
    $commandName[^input.getCommandName[]]
    $self.options[^hash::create[$input.options]]

    $result[^#0A]
    ^if(!def $commandName || !^self.hasCommand[$commandName]){
        $result[$result^showHelp[]]
    }{
        $result[$result^self.commands.$commandName.run[$input;$output]]
    }
###


#-----------------------------------------------------------------------------
#Displays list of command.
#
#:result string
#-----------------------------------------------------------------------------
@showHelp[][result]
    $info[^table::create[nameless]{}]

    ^commands.foreach[key;value]{
        ^info.append[$key	$value.description]
    }
    $result[
Usage:
  command [arguments] [--option[=value]] [-o [value]]

Available commands:
^Ln-e/Console/Output/Helper/TableHelper:formatTable[$info;  ]]
###
