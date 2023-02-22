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
        $value = $value[$k]
        if($value -eq $null)
        {
            return $null
        }
    }

    return $value

}

#You can run Get-NestedValue -key $key -Object $Object in the cmdlet to execute the above code .


#Approach 2:

#We can use Select-Object cmdlet to retrieve the value of an object.
# Select object can be used to retrieve the value from a nested object .

$Object = @{
    a = @{
        b = @{
            c = "d"
        }
    }
}

$key = "a/b/c"

$value = ($Object | Select-Object ($key -split "/")).($key -split "/")[-1]