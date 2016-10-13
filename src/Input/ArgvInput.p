# Created by IntelliJ IDEA.
# User: ibodnar
# Date: 02.10.16
# Time: 10:39
# To change this template use File | Settings | File Templates.

@CLASS
Ln-e/Console/Input/ArgvInput

@BASE
Ln-e/Console/Input/InputInterface

@OPTIONS
locals

@auto[]
###


#-----------------------------------------------------------------------------
#:constructor
#
#:param configuration type Ln-e/Console/CommandConfiguration
#-----------------------------------------------------------------------------
@create[configuration]
    $self.configuration[]
    $self.arguments[^hash::create[]]
    $self.options[^hash::create[]]
###


#-----------------------------------------------------------------------------
#:result string Name of the command
#-----------------------------------------------------------------------------
@getCommandName[][result]
    $result[$request:argv.1]
###


#-----------------------------------------------------------------------------
#Set configuration of command for parsing params
#
#:param configuration type Ln-e/Console/CommandConfiguration
#-----------------------------------------------------------------------------
@bindConfiguration[configuration]
    $self.configuration[$configuration]
    ^self.parse[]
###


#-----------------------------------------------------------------------------
#:param name type string
#
#:result string
#-----------------------------------------------------------------------------
@getArgument[name][result]
    $result[$self.arguments.$name]
###


#-----------------------------------------------------------------------------
#:param name type string
#
#:result string
#-----------------------------------------------------------------------------
@getOption[name][result]
    $result[$self.options.$name]
###


#-----------------------------------------------------------------------------
#:param name type string
#
#:result bool
#-----------------------------------------------------------------------------
@hasOption[name][result]
    $result(^self.options.contains[$name])
###


#-----------------------------------------------------------------------------
#Fills self.arguments and self.options by CommandConfiguration
#-----------------------------------------------------------------------------
@parse[]
    $params[^self.prepareParams[]]

    $requiredNumber(0)
    $argumentsValue[^hash::create[]]
    $self.parsedOptions[^hash::create[]]
    $i(0)
    $isRequired(true)

    ^self.configuration.arguments.foreach[key;argument]{
        $argumentName[$argument.name]

        ^if(^argument.isRequired[] && !$isRequired){
            ^throw[LogicException;;Required argument '$argumentName' could not be after optional]
        }
        $self.arguments.$argumentName[$argument.default]
        ^if(^params.arguments._count[]>$i){
            $self.arguments.$argumentName[^params.arguments._at($i)]
        }

        ^if(!^argument.isRequired[] && !def $self.arguments.$argumentName){
            ^throw[MissingArgumentException;;Missing required argument '$argumentName']
        }
        $i($i+1)
    }

    ^self.configuration.options.foreach[key;option]{
        ^if(^params.options.contains[$option.name]){
            $self.options.[$option.name][$params.options.[$option.name]]
        }(def $option.shortcut && ^params.options.contains[$option.shortcut]){
            $self.options.[$option.name][$params.options.[$option.shortcut]]
        }
    }
###


#-----------------------------------------------------------------------------
#Parses and converts arguments from command line
#
#:result hash
#-----------------------------------------------------------------------------
@prepareParams[][result]
    $result[^hash::create[
        $.arguments[^hash::create[]]
        $.options[^hash::create[]]
    ]]
    $i(2)
    ^while($i < ^request:argv._count[]){
        $param[$request:argv.$i]
        ^if(def $param && ^param.pos[-] != 0){
            $ind[^result.arguments._count[]]
            $result.arguments.$ind[$param]
        }(^param.pos[--] == 0){
            $split[^param.match[--([^^\s=]+)=?(\S+)?][i]]
            $result.options.[$split.1][$split.2]
        }(^param.pos[-] == 0){
            $key[^param.mid(1)]
            $value[]
            $next($i+1)
            $nextParam[$request:argv.$next]
            ^if(^nextParam.pos[-] != 0){
                $value[$nextParam]
                ^i.inc[] ^rem[ for skip used param]
            }
            $result.options.$key[$value]
        }
        ^i.inc[]
    }
###
