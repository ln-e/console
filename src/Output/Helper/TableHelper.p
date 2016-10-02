# Created by IntelliJ IDEA.
# User: ibodnar
# Date: 19.04.16
# Time: 9:09
# To change this template use File | Settings | File Templates.

@CLASS
Ln-e/Console/Output/Helper/TableHelper

@OPTIONS
locals
static

@auto[]
###


#-----------------------------------------------------------------------------
#Prints table
#
#:param table type table
#:param prefix type string
#
#:result string
#-----------------------------------------------------------------------------
@static:formatTable[table;prefix][result;columnLength]

    ^if(!($table is table)){
        ^throw[TableHelperException;;Table isn't instance of table]
    }

    $columnLength[^hash::create[]]

    ^table.fields.foreach[name;value]{
        $columnLength.$name(^name.length[] + 3)
    }

    ^table.foreach[pos;row]{
        $fields[$table.fields]
        ^fields.foreach[name;value]{
            ^if(!def $columnLength.$name || ^value.length[] + 3 > $columnLength.$name){
                $columnLength.$name(^value.length[] + 3)
            }
        }
    }
    $seperator[^Ln-e/Console/Output/Helper/TableHelper:drawSeparator[$columnLength]]
    $fields[$table.fields]

    $result[${prefix}$seperator^#0A]
    ^if(^table.columns[]){
        $result[${result}${prefix}^Ln-e/Console/Output/Helper/TableHelper:drawHeader[$fields;$columnLength]^#0A]
        $result[${result}${prefix}$seperator^#0A]
    }
    $result[${result}^table.menu{${prefix}^Ln-e/Console/Output/Helper/TableHelper:drawLine[$table.fields;$columnLength]}[^#0A]]
    $result[${result}^#0A${prefix}$seperator]
###


#-----------------------------------------------------------------------------
#Prints table header
#
#:param fields type hash
#:param columnLength type hash
#
#:result string
#-----------------------------------------------------------------------------
@static:drawHeader[fields;columnLength][result]
    $result[|^fields.foreach[name;value]{^Ln-e/Console/Output/Helper/TableHelper:padRight[$name; ;$columnLength.$name]}[|]|]
###


#-----------------------------------------------------------------------------
#Prints table line
#
#:param fields type hash
#:param columnLength type hash
#
#:result string
#-----------------------------------------------------------------------------
@static:drawLine[fields;columnLength][result]
    $result[|^fields.foreach[name;value]{^Ln-e/Console/Output/Helper/TableHelper:padRight[$value; ;$columnLength.$name]}[|]|]
###


#-----------------------------------------------------------------------------
#Prints table separator
#
#:param hash type hash with columns data
#
#:result string
#-----------------------------------------------------------------------------
@static:drawSeparator[hash][result]
    $result[+^hash.foreach[name;length]{^for[i](1;$length){-}}[+]+]
###


#-----------------------------------------------------------------------------
#Adds $symbol to $string from the right until string's length lower than $length
#
#:param string type string
#:param symbol type string
#:param length type int
#
#:result string
#-----------------------------------------------------------------------------
@static:padRight[string;symbol;length][result]
    $length($length - 1)

    ^if(^string.length[] >= $length){
        $result[ $string]
    }{
        $pad[]
        ^for[i](1;$length-^string.length[]){
            $pad[${pad}$symbol]
        }
        $result[ ${string}$pad]
    }
###
