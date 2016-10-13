# Created by IntelliJ IDEA.
# User: ibodnar
# Date: 02.10.16
# Time: 13:09
# To change this template use File | Settings | File Templates.

@CLASS
Ln-e/Console/CommandConfiguration

@OPTIONS
locals

@auto[]
###


#-----------------------------------------------------------------------------
#:constructor
#-----------------------------------------------------------------------------
@create[]
    $self.arguments[^hash::create[]]
    $self.options[^hash::create[]]
###


#-----------------------------------------------------------------------------
#:param argument type Ln-e/Console/Input/CommandArgument
#-----------------------------------------------------------------------------
@addArgument[argument]
    $self.arguments.[^self.arguments._count[]][$argument]
###


#-----------------------------------------------------------------------------
#:param option type Ln-e/Console/Input/CommandOption
#-----------------------------------------------------------------------------
@addOption[option]
    $self.options.[^self.options._count[]][$option]
###
