$List = Get-Content "C:\Users\zdieter\Documents\Scripts\GetManager\EnabledList.txt"
Connect-AzureAD


ForEach($Item in $List){
    $info=@{}
    
    $userDetails = Get-ADUser -Filter 'Name -like $Item' -properties displayName, manager
    
    $info["User"]=$userDetails.displayName
  
    IF ($userDetails.manager) # if not null
    
    {
    
    $managerDetails = Get-ADUser (Get-ADUser -Filter 'Name -like $Item' -properties manager).manager -properties displayName
    
    $info["Manager"]=$managerDetails.displayName
    
    }
    
    New-Object -TypeName PSObject -Property $info
        
}




#$UserWriter | Out-File -FilePath "C:\Users\zdieter\Documents\Scripts\GetManager\UserWithManger.txt"