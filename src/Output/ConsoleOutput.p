# Created by IntelliJ IDEA.
# User: ibodnar
# Date: 02.10.16
# Time: 11:16
# To change this template use File | Settings | File Templates.

@CLASS
Ln-e/Console/Output/ConsoleOutput

@BASE
Ln-e/Console/Output/AbstractOutput

@OPTIONS
locals

@auto[]
    $self.cursorUp[^#1b^[1F]
###


#-----------------------------------------------------------------------------
#Writes a message to the output, depends on concrete outputter
#
#:param message type string A message to write to the output
#:param message type bool   Whether to add a newline or not
#-----------------------------------------------------------------------------
@doWrite[message;newline]
    $console:line[$message]
    ^if(^newline.int(0)){
        $console:line[${Ln-e/Console/Output/ConsoleOutput:cursorUp}]
    }
###
