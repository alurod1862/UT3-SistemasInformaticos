$file_groups=Import-Csv -Path grupos.csv 
foreach ($group in $file_groups) { 
  New-LocalGroup -Name $group.nombre -Description $group.Descripcion
}
