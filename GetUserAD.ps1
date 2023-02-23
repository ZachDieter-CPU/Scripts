$List = Get-Content ""


$UserWriter = "Names`n"

ForEach($Item in $List){
   # Write-Output $Item
    $User = Get-ADUser -Filter 'Name -like $Item' -Properties UserPrincipalName
    $NewItem = $Item + "."
    $UserWithPeriod = Get-ADUser -Filter 'Name -like $NewItem' -Properties UserPrincipalName
     
        
    
    
        
    if($User -and $User.Enabled -eq "True"){

        $UserInfoCount = $User.Name | Measure-Object
        if($UserInfoCount.Count -gt "1"){
            $UserWriter += $User.Name[0] + "| Enabled`n"
        }else{
            $UserWriter += $User.Name + "| Enabled`n"
        }

    }elseif($UserWithPeriod -and $UserWithPeriod.Enabled -eq "True"){

        $UserInfoCount = $UserWithPeriod.Name | Measure-Object
        if($UserInfoCount.Count -gt "1"){
            $UserWriter += $UserWithPeriod.Name[0] + "| Enabled`n"
        }else{
            $UserWriter += $UserWithPeriod.Name + "| Enabled`n"
        }

    }elseif($User -or $UserWithPeriod){
        if($User){
            $UserWriter += $User.Name + "| Disabled`n"
        }elseif($UserWithPeriod){
            $UserWriter += $UserWithPeriod.Name + "| Disabled`n"
        }
    }else{
        $UserWriter += $Item + "| Could not be found`n"
    }
    
}


#Write-Output $UserWriter

$UserWriter | Out-File -FilePath ""
