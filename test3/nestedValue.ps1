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


function Get-NestedValue{
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [object]$Object,
    [Parameter(Mandatory=$true)]
    [string]$key
)
    $keys  = $key -split '/'
    $value = $Object

    foreach($k in $keys){
        $value = $value.$k
    }

    return $value

}

#You can run Get-NestedValue -key $key -Object $Object in the cmdlet to execute the above code .

#Example Usage 

# $obj = @{
#     a = @{
#         b = @{
#             c = "d"
#         } 
#     }
# }

# $key ="a/b/c"

# $value = Get-NestedValue -Object $obj -Key $key

# Write-Output $value
