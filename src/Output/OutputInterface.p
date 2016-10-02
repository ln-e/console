# Created by IntelliJ IDEA.
# User: ibodnar
# Date: 02.10.16
# Time: 10:39
# To change this template use File | Settings | File Templates.

@CLASS
Ln-e/Console/Output/OutputInterface

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
#Writes a message to the output.
#
#:param message type string|array The message as an array of lines or a single string
#:param newline type bool Whether to add a newline
#-----------------------------------------------------------------------------
@write[messages;newline;options]
    ^throw[LogicException;;Abstract method is not implemented]
###


#-----------------------------------------------------------------------------
#Writes a message to the output and adds a newline at the end.
#
#:param messages type string|array The message as an array of lines of a single string
#-----------------------------------------------------------------------------
@writeln[messages]
    ^throw[LogicException;;Abstract method is not implemented]
###
