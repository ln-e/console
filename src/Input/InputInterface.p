# Created by IntelliJ IDEA.
# User: ibodnar
# Date: 02.10.16
# Time: 10:39
# To change this template use File | Settings | File Templates.

@CLASS
Ln-e/Console/Input/InputInterface

@OPTIONS
locals

@auto[]
###


#-----------------------------------------------------------------------------
#:constructor
#-----------------------------------------------------------------------------
@create[]
###


#-----------------------------------------------------------------------------
#:param name type string
#
#:result string
#-----------------------------------------------------------------------------
@getArgument[name][result]
    ^throw[LogicException;;Abstract method is not implemented]
###


#-----------------------------------------------------------------------------
#:param name type string
#
#:result string
#-----------------------------------------------------------------------------
@getOption[name][result]
    ^throw[LogicException;;Abstract method is not implemented]
###


#-----------------------------------------------------------------------------
#:param name type string
#
#:result string
#-----------------------------------------------------------------------------
@hasOption[name][result]
    ^throw[LogicException;;Abstract method is not implemented]
###


#-----------------------------------------------------------------------------
#:result string Name of the command
#-----------------------------------------------------------------------------
@getCommandName[][result]
    ^throw[LogicException;;Abstract method is not implemented]
###
