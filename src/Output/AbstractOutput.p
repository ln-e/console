# Created by IntelliJ IDEA.
# User: ibodnar
# Date: 02.10.16
# Time: 11:16
# To change this template use File | Settings | File Templates.

@CLASS
Ln-e/Console/Output/AbstractOutput

@BASE
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
@write[messages;newline]
    ^if($messages is string){
        $messages[$.0[$messages]]
    }(!($messages is hash)){
        ^throw[InvalidArgumentExpection;;Messages argument should be string or hash "^reflection:class_name[$messages]" given]
    }

    ^messages.foreach[id;message]{
        ^self.doWrite[$message;$newline]
    }
###


#-----------------------------------------------------------------------------
#Writes a message to the output and adds a newline at the end.
#
#:param messages type string|array The message as an array of lines of a single string
#-----------------------------------------------------------------------------
@writeln[messages]
    $self.write[$messages](true)
###


#-----------------------------------------------------------------------------
#Writes a message to the output, depends on concrete outputter
#
#:param message type string A message to write to the output
#:param message type bool   Whether to add a newline or not
#-----------------------------------------------------------------------------
@doWrite[message;newline]
    ^throw[LogicException;;Abstract method is not implemented]
###
