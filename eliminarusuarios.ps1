$usuarios=Import-Csv -Path usuarios.csv
foreach  ($user in $usuarios)
{
    $clave=ConvertTo-SecureString $user.password -AsPlainText -Force
	Remove-LocalUser $user.cuenta
}
