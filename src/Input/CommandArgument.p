# Created by IntelliJ IDEA.
# User: ibodnar
# Date: 12.03.2016
# Time: 23:26
# To change this template use File | Settings | File Templates.

@CLASS
Ln-e/Console/Input/CommandArgument

@OPTIONS
locals


@auto[]
    $self.OPTIONAL(1)
    $self.REQUIRED(2)
    $self.ARRAY(4)
###


#-----------------------------------------------------------------------------
#:constructor
#
#:param name type string
#:param mode type int
#:param default type string
#:param description type string
#-----------------------------------------------------------------------------
@create[name;mode;default;description]
    $self.name[$name]
    $self.mode(^mode.int(1))
    $self.default[$default]
    $self.description[$description]
###


#-----------------------------------------------------------------------------
#Check whatever argument is required
#
#:result bool
#-----------------------------------------------------------------------------
@isRequired[]
    $result($self.mode & ${Ln-e/Console/Input/CommandArgument:REQUIRED})
###


#-----------------------------------------------------------------------------
#Check whatever argument is array
#
#:result bool
#-----------------------------------------------------------------------------
@isArray[]
    $result($self.mode & ${Ln-e/Console/Input/CommandArgument:ARRAY})
###
