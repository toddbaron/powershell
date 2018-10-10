#
#Script: bulkpwordchangecsv.ps1
#Description: This script allows you to upload a CSV file that contains usernames and assigned passwords. The script
#then changes each username's password to its respective password listed in the CSV.
#
#Written by: Todd Baron, adapted from Mohammed Wasay at
#https://www.mowasay.com/2016/10/active-directory-changing-passwords-for-users-in-bulk-using-a-csv-file/
#
#
$reply = Read-Host -Prompt "Are you sure you want to continue?[y/n]"
while ($reply -ne "y"){
  if ($reply -eq "n"){
    exit
}
  $reply = Read-Host "Are you sure you want to continue?[y/n]?"
}

Import-Module ActiveDirectory
$PaswordList = Import-Csv "UNCPath"
ForEach ($User in $PasswordList) {
  $User.sAMAccountName
  $User.Password
  Set-ADAccountPassword -Identity $User.sAMAccountName -NewPassword (ConvertTo-SecureString $User.Password -AsPlainText -Force) -Reset
  }
