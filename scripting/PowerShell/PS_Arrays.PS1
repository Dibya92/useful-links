<#
   In powershell An array is a data structure that is designed to store a collection  of items. 
   The items can be the same type or different types.Run command 'help about_Arrays' to know more about arrays 
#>

 #CREATING AND INITIALIZING AN ARRAY
 
   #Array from comma operator
   $arr = 1,1,5,6,7                       #The comma operator is the array construction operator in PowerShell
   $arr = 3,4,5,'Cool',4,'Hello World'
  
   #Empty Array
   $empty_arr = @()  #the @( … ) operation is syntactic sugar for [array] $( … ) i.e a covariant conversions or casting like "$arr = [array] 1,'Dibya',2"
   $empty_arr = $null
   
   #Array of one element
   $arr = ,1
  
   #Array from array sub-expression operator like @(<objects>) or casting like [array] <objects>
   $arr = @(1,4,4,'Dibya')
  
   #Array from return value of PS cmdlet
   $services = get-service s*
   
   #initialize an array by using the range operator (..)
   $arr = 5..8
 
 #CHECKING IF SOMETHING IS AN ARRAY 
 $arr -is [Array]

 #To FIND NO OF ELEMENTS PRESENT WITHIN AN ARRAY WE WILL USE PROPERTIES LIKE

   $arr = 1,3,5,'Egg','Bread'
   
   #Length Property
   $arr.Length
   
   #Count Property
   $arr.Count
 
   #TO ENUMERATE AN ARRAY
   
   #Write the array to pipeline and PS will automaticall enumerate it 
   $arr = @(1,2,3,4,5,6,7,8,9)
   $arr | where{ $_ -lt 6 }

   #Using forech
   $arr = @(1,2,@(3,5,7),'This is messed up')
   foreach($item in $arr){Write-Host $item.GetType()}

   #Pulling out individual values using array index
   $arr = @(1,2,@(3,5,7),'This is messed up')
   $arr[0]                                   #Gives firstvalue 
   $arr[-1]                                  #Gives lastvalue
   $arr[1..2]                                #Gives value at index 1 and 2
   $arr[-1..-2]                              #Gives last two values


 #MANIPULATING ARRAY

   <#PS Arrays are immutable -meaning (that in the background it creates a whole new array that includes the new value
     and then discards the old array),You can change the elements in an array, add an element to an array, and
     combine the values from two arrays into a third array. 
    #>

   #Append an extra element to an array using += operator
   $countries = [Array] 'USA','JAPAN','UK'
   $countries += 'India'

   <#Adding items to a large array can be quite slow, a PowerShell array variable is immutable
     A faster alternative to use a .Net ArrayList:
    #>
   
   $countries = New-Object System.Collections.ArrayList
   $countries.Add('India') > $null
   $countries.Add('Montenegro') > $null 

   <# In PowerShell 4.0+ arrays have the methods .Where() and .Foreach() a faster alternative to a 
      traditional pipeline at the expense of a higher memory consumption
    #>

    @(Get-Service).Where{$_.Status -eq 'stopped'}

    
    #With an array, comparison operators -eq,-gt,-lt  will work as a filter returning all the values which match.

    $a = 1,2,3,2
    $a -eq 2




 #Getting More Information About Array

    $myarray = @(1,2,'Egg','Milk',-66)
    
    <#When you create an array without specifying a datatype, PowerShell will create the array as an object array.
      To determine the data type of an array:
     #>
   
    $myArray.gettype()

    <#PowerShell is not case-sensitive so $myArray is treated the same as $Myarray
      If you pipe an array to Get-Member, it will display information about the objects in the array. 
      If you use Get-Member -InputObject, that will display information about the array itself:
     #>

     $myArray | Get-Member
     
     Get-Member -inputobject $myArray
