# Created by IntelliJ IDEA.
# User: ibodnar
# Date: 13.02.16
# Time: 20:21
# To change this template use File | Settings | File Templates.

@CLASS
Ln-e/Console/CommandInterface

@OPTIONS
locals


#-----------------------------------------------------------------------------
#:constructor
#
#:param name type string
#-----------------------------------------------------------------------------
@create[name]
    $self.parsedOptions[^hash::create[]]
    ^if(def $name){
        $self.name[$name]
    }
    $self.description[]
    $self.help[]
    $self.configuration[^Ln-e/Console/CommandConfiguration::create[]]
###


#-----------------------------------------------------------------------------
#:result string
#-----------------------------------------------------------------------------
@configure[]
    ^throw[LogicException;;You must override the @configure method in the concrete command class.]
###


#-----------------------------------------------------------------------------
#Abstract method for command execution
#
#:param input type Ln-e/Console/Input/InputInterface
#:param output type Ln-e/Console/Output/OutputInterface
#-----------------------------------------------------------------------------
@execute[input;output]
    ^throw[LogicException;;You must override the @execute method in the concrete command class.]
###


#-----------------------------------------------------------------------------
#:param name type string
#:param mode type int
#:param default type string
#:param description type string
#-----------------------------------------------------------------------------
@addArgument[name;mode;description;default]
    ^self.configuration.addArgument[^Ln-e/Console/Input/CommandArgument::create[$name;$mode;$description;$default]]
###


#-----------------------------------------------------------------------------
#:param name type string
#:param required type bool
#:param default type string
#:param description type string
#-----------------------------------------------------------------------------
@addOption[name;shortcut;default;description]
    ^self.configuration.addOption[^Ln-e/Console/Input/CommandOption::create[$name;$shortcut;$default;$description]]
###


#-----------------------------------------------------------------------------
#Common command execution start checks. Validate count of arguments.
#
#:param input type InputInterface
#:param output type OutputInterface
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

    ^try{
        ^input.bindConfiguration[$self.configuration]

        $result[^self.execute[$input;$output]]
    }{
        ^if($exception.type eq MissingArgumentException){
            $exception.handled(true)
            $result[$exception.comment]
#           TODO Add command help to output
        }
    }
###


#-----------------------------------------------------------------------------
#:param name type string
#
#:result string
#-----------------------------------------------------------------------------
@validateName[name][result]
    ^if(^name.match[^^[^^\:]++(\:[^^\:]++)*^$][in] == 0){
        ^throw[InvalidArgumentException;;'$name' is invalid command name]
    }
    $result[$name]
###


#-----------------------------------------------------------------------------
#:param name type string
#-----------------------------------------------------------------------------
@SET_name[name]
    $self._name[^self.validateName[$name]]
###


#-----------------------------------------------------------------------------
#:result string
#-----------------------------------------------------------------------------
@GET_name[][result]
    $result[$self._name]
###
