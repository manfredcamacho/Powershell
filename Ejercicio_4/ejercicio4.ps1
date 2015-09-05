﻿#############################################################################################
# PROGRAM-ID.  ejercicio4.ps1					                                            #
# OBJETIVO DEL PROGRAMA: Cuenta las ocurrencias de una palabra en un archivo o              #
# lo ingresado por teclado                                                                  #
# TIPO DE PROGRAMA: .ps1                                                                    #
# ARCHIVOS DE SALIDA :                                                                      #
# COMENTARIOS:                                                                              #
# ALUMNOS :                                                                                 #                                                                              
#           -Bogado, Sebastian                                                              #
#           -Camacho, Manfred                                                               #
#           -Cruz, Juan                                                                     #
#           -Gustavo, Gonzalez                                                              #
#           -Valenzuela, Santiago                                                           #
# EjemploEj.:                                                                               #
# C:\PS> .\ejercicio4.ps1                                                                   #
#############################################################################################
<#
.SYNOPSIS


.DESCRIPTION
Cuenta las ocurrencias de una palabra en un archivo o lo ingresado por teclado                                                       
    
#>
  param
  (
    [Parameter(ValueFromPipeline=$true, mandatory = $true)][ValidateNotNullOrEmpty()]
    $path
  )
   try{
   $linea = (Get-Content $path)
   }
   catch{
   Write-Output "Error al leer archivo"
   }
   $palabras = @{}
   
   
    foreach($auxLinea in $linea)
    {
       
        $camposLinea = $auxLinea.split(' ')
        foreach($auxCampos in $camposLinea)
        {
            $marca = 0
            #recorro el hashtable para ver si existe la palabra de la linea en el 
            foreach($auxPalabras in $palabras.Keys)
            {
                
                if($auxPalabras -eq $auxCampos)
                {
                   
                    $palabras[$auxPalabras]++
                    $marca = 1
                    break
                }
            }   
            if($marca -eq 0)
            {
                $palabras.Add($auxCampos,1)
            }
        }
    }
    $palabras | Format-Table
    
  