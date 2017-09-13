﻿# Enforce WorkingDir
#--------------------------------------------------
$Script:ScriptDir = Split-Path -Path $MyInvocation.MyCommand.Path -parent
$root = "$ScriptDir\.."
$Module = "$root\PSIni"
$Functions = "$root\PSIni\Functions"
Set-Location $ScriptDir

$testFile = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
# functions and tests stored in separate directories; adjusting dot-sourcing
. "$Functions\$testFile"

Describe "Remove-IniEntry" {

    # assert
    Context "Alias" {
        It "Remove-IniEntry alias should exist" {
            Get-Alias -Definition Remove-IniEntry | Where-Object {$_.name -eq "rie"} | Measure-Object | Select-Object -ExpandProperty Count | Should Be 1
        }
    }
}
