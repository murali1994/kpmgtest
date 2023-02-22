# We have a nested object. We would like a function where you pass in the object and a key and
# get back the value.
# The choice of language and implementation is up to you.
# Example Inputs
# object = {“a”:{“b”:{“c”:”d”}}}
# key = a/b/c
# object = {“x”:{“y”:{“z”:”a”}}}
# key = x/y/z
# value = a

#Solution :

#Approach 1:

[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [Hashtable]$Object,
    [Parameter(Mandatory=$true)]
    [string]$key
)

function Get-NestedValue{

    $keys  = $key -split '/'
    $value = $Object

    foreach($k in $keys){
        $value = $value.$k
    }

    return $value

}

#You can run Get-NestedValue -key $key -Object $Object in the cmdlet to execute the above code .


