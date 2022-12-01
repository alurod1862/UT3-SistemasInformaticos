$usuarios=Import-Csv -Path usuarios.csv
foreach  ($user in $usuarios)
{
    $clave=ConvertTo-SecureString $user.password -AsPlainText -Force
	Remove-LocalUser $user.cuenta
}

$file_groups=Import-Csv -Path Grupos.csv 
foreach ($group in $file_groups) { 
  Remove-LocalGroup $group.nombre
}
