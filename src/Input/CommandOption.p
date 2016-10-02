# Created by IntelliJ IDEA.
# User: ibodnar
# Date: 12.03.2016
# Time: 23:26
# To change this template use File | Settings | File Templates.

@CLASS
Ln-e/Console/Input/CommandOption

@OPTIONS
locals


#-----------------------------------------------------------------------------
#:constructor
#
#:param name type string
#:param required type bool
#:param default type string
#:param description type string
#-----------------------------------------------------------------------------
@create[name;shortcut;default;description]
    $self.name[$name]
    $self.shortcut[$shortcut]
    $self.default[$default]
    $self.description[$description]
###
