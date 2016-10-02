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
###


#-----------------------------------------------------------------------------
#:constructor
#
#:param name type string
#:param required type bool
#:param default type string
#:param description type string
#-----------------------------------------------------------------------------
@create[name;mode;default;description]
    $self.name[$name]
    $self.required(^required.int(0))
    $self.default[$default]
    $self.description[$description]
###


#-----------------------------------------------------------------------------
#Check whatever argument is required
#
#:result bool
#-----------------------------------------------------------------------------
@isRequired[]
    $result($self.required)
###
