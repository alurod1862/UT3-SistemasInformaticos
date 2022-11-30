$file_users=Import-Csv -Path usuarios.csv 
foreach ($user in $file_users) { 
  $clave=ConvertTo-SecureString $user.password -AsPlainText -Force
  New-LocalUser $user.cuenta -Password $clave -FullName $user.nombrecompleto -Description $user.descripcion -AccountNeverExpires -PasswordNeverExpires
  #Añadimos la cuenta de usuario en el grupo de Usuarios del sistema
  Add-LocalGroupMember -Group usuarios -Member $user.cuenta
  #Add-LocalGroupMember -Group $user.departamento -Member $user.cuenta



  Set-LocalUser $user.cuenta -PasswordNeverExpires $false
  net user $user.cuenta /logonpasswordchg:yes






}
