# region Generated 
  # ----------------------------------------------------------------------------------
  # Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# Code generated by Microsoft (R) AutoRest Code Generator.Changes may cause incorrect behavior and will be lost if the code
# is regenerated.
  # ----------------------------------------------------------------------------------
  # Load required Az.Accounts module
  $accountsName = 'Az.Accounts'
  $accountsModule = Get-Module -Name $accountsName
  if(-not $accountsModule) {
    $localAccountsPath = Join-Path $PSScriptRoot 'generated\modules'
    if(Test-Path -Path $localAccountsPath) {
      $localAccounts = Get-ChildItem -Path $localAccountsPath -Recurse -Include 'Az.Accounts.psd1' | Select-Object -Last 1
      if($localAccounts) {
        $accountsModule = Import-Module -Name ($localAccounts.FullName) -Scope Global -PassThru
      }
    }
    if(-not $accountsModule) {
      $hasAdequateVersion = (Get-Module -Name $accountsName -ListAvailable | Where-Object { $_.Version -ge [System.Version]'2.7.5' } | Measure-Object).Count -gt 0
      if($hasAdequateVersion) {
        $accountsModule = Import-Module -Name $accountsName -MinimumVersion 2.7.5 -Scope Global -PassThru
      }
    }
  }

  if(-not $accountsModule) {
    Write-Error "`nThis module requires $accountsName version 2.7.5 or greater. For installation instructions, please see: https://docs.microsoft.com/powershell/azure/install-az-ps" -ErrorAction Stop
  } elseif (($accountsModule.Version -lt [System.Version]'2.7.5') -and (-not $localAccounts)) {
    Write-Error "`nThis module requires $accountsName version 2.7.5 or greater. An earlier version of Az.Accounts is imported in the current PowerShell session. If you are running test, please try to add the switch '-RegenerateSupportModule' when executing 'test-module.ps1'. Otherwise please open a new PowerShell session and import this module again.`nAdditionally, this error could indicate that multiple incompatible versions of Azure PowerShell modules are installed on your system. For troubleshooting information, please see: https://aka.ms/azps-version-error" -ErrorAction Stop
  }
  Write-Information "Loaded Module '$($accountsModule.Name)'"

  # Load the private module dll
  $null = Import-Module -Name (Join-Path $PSScriptRoot './bin/Az.MSGraph.private.dll')

  # Get the private module's instance
  $instance = [Microsoft.Azure.PowerShell.Cmdlets.Resources.MSGraph.Module]::Instance

  # Ask for the shared functionality table
  $VTable = Register-AzModule
  
  # Tweaks the pipeline on module load
  $instance.OnModuleLoad = $VTable.OnModuleLoad

  # Following two delegates are added for telemetry
  $instance.GetTelemetryId = $VTable.GetTelemetryId
  $instance.Telemetry = $VTable.Telemetry
  

  # Tweaks the pipeline per call
  $instance.AddRequestUserAgentHandler = $VTable.AddRequestUserAgentHandler

  # Tweaks the pipeline per call
  $instance.AddPatchRequestUriHandler = $VTable.AddPatchRequestUriHandler

  # Tweaks the pipeline per call
  $instance.AddAuthorizeRequestHandler = $VTable.AddAuthorizeRequestHandler
    
  
  # Gets shared parameter values
  $instance.GetParameterValue = $VTable.GetParameterValue
  
  # Allows shared module to listen to events from this module
  $instance.EventListener = $VTable.EventListener
  
  # Gets shared argument completers
  $instance.ArgumentCompleter = $VTable.ArgumentCompleter
  
  # The name of the currently selected Azure profile
  $instance.ProfileName = $VTable.ProfileName

 
  # Load the custom module
  $customModulePath = Join-Path $PSScriptRoot './custom/Az.MSGraph.custom.psm1'
  if(Test-Path $customModulePath) {
    $null = Import-Module -Name $customModulePath
  }
  
  # Export nothing to clear implicit exports
  Export-ModuleMember

  # Export proxy cmdlet scripts
  $exportsPath = Join-Path $PSScriptRoot './exports'
  $directories = Get-ChildItem -Directory -Path $exportsPath
  $profileDirectory = $null
  if($instance.ProfileName) {
    if(($directories | ForEach-Object { $_.Name }) -contains $instance.ProfileName) {
      $profileDirectory = $directories | Where-Object { $_.Name -eq $instance.ProfileName }
    } else {
      # Don't export anything if the profile doesn't exist for the module
      $exportsPath = $null
      Write-Warning "Selected Azure profile '$($instance.ProfileName)' does not exist for module '$($instance.Name)'. No cmdlets were loaded."
    }
  } elseif(($directories | Measure-Object).Count -gt 0) {
    # Load the last folder if no profile is selected
    $profileDirectory = $directories | Select-Object -Last 1
  }
  
  if($profileDirectory) {
    Write-Information "Loaded Azure profile '$($profileDirectory.Name)' for module '$($instance.Name)'"
    $exportsPath = $profileDirectory.FullName
  }
  
  if($exportsPath) {
    Get-ChildItem -Path $exportsPath -Recurse -Include '*.ps1' -File | ForEach-Object { . $_.FullName }
    $cmdletNames = Get-ScriptCmdlet -ScriptFolder $exportsPath
    Export-ModuleMember -Function $cmdletNames -Alias (Get-ScriptCmdlet -ScriptFolder $exportsPath -AsAlias)
  }

  # Finalize initialization of this module
  $instance.Init();
  Write-Information "Loaded Module '$($instance.Name)'"
# endregion

# SIG # Begin signature block
# MIInugYJKoZIhvcNAQcCoIInqzCCJ6cCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCArqRDSagtA2o5C
# bJTpzbkNwkzF1nvrY8AhPyOIRi0TlaCCDYEwggX/MIID56ADAgECAhMzAAACUosz
# qviV8znbAAAAAAJSMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjEwOTAyMTgzMjU5WhcNMjIwOTAxMTgzMjU5WjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQDQ5M+Ps/X7BNuv5B/0I6uoDwj0NJOo1KrVQqO7ggRXccklyTrWL4xMShjIou2I
# sbYnF67wXzVAq5Om4oe+LfzSDOzjcb6ms00gBo0OQaqwQ1BijyJ7NvDf80I1fW9O
# L76Kt0Wpc2zrGhzcHdb7upPrvxvSNNUvxK3sgw7YTt31410vpEp8yfBEl/hd8ZzA
# v47DCgJ5j1zm295s1RVZHNp6MoiQFVOECm4AwK2l28i+YER1JO4IplTH44uvzX9o
# RnJHaMvWzZEpozPy4jNO2DDqbcNs4zh7AWMhE1PWFVA+CHI/En5nASvCvLmuR/t8
# q4bc8XR8QIZJQSp+2U6m2ldNAgMBAAGjggF+MIIBejAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQUNZJaEUGL2Guwt7ZOAu4efEYXedEw
# UAYDVR0RBEkwR6RFMEMxKTAnBgNVBAsTIE1pY3Jvc29mdCBPcGVyYXRpb25zIFB1
# ZXJ0byBSaWNvMRYwFAYDVQQFEw0yMzAwMTIrNDY3NTk3MB8GA1UdIwQYMBaAFEhu
# ZOVQBdOCqhc3NyK1bajKdQKVMFQGA1UdHwRNMEswSaBHoEWGQ2h0dHA6Ly93d3cu
# bWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY0NvZFNpZ1BDQTIwMTFfMjAxMS0w
# Ny0wOC5jcmwwYQYIKwYBBQUHAQEEVTBTMFEGCCsGAQUFBzAChkVodHRwOi8vd3d3
# Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY0NvZFNpZ1BDQTIwMTFfMjAx
# MS0wNy0wOC5jcnQwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQsFAAOCAgEAFkk3
# uSxkTEBh1NtAl7BivIEsAWdgX1qZ+EdZMYbQKasY6IhSLXRMxF1B3OKdR9K/kccp
# kvNcGl8D7YyYS4mhCUMBR+VLrg3f8PUj38A9V5aiY2/Jok7WZFOAmjPRNNGnyeg7
# l0lTiThFqE+2aOs6+heegqAdelGgNJKRHLWRuhGKuLIw5lkgx9Ky+QvZrn/Ddi8u
# TIgWKp+MGG8xY6PBvvjgt9jQShlnPrZ3UY8Bvwy6rynhXBaV0V0TTL0gEx7eh/K1
# o8Miaru6s/7FyqOLeUS4vTHh9TgBL5DtxCYurXbSBVtL1Fj44+Od/6cmC9mmvrti
# yG709Y3Rd3YdJj2f3GJq7Y7KdWq0QYhatKhBeg4fxjhg0yut2g6aM1mxjNPrE48z
# 6HWCNGu9gMK5ZudldRw4a45Z06Aoktof0CqOyTErvq0YjoE4Xpa0+87T/PVUXNqf
# 7Y+qSU7+9LtLQuMYR4w3cSPjuNusvLf9gBnch5RqM7kaDtYWDgLyB42EfsxeMqwK
# WwA+TVi0HrWRqfSx2olbE56hJcEkMjOSKz3sRuupFCX3UroyYf52L+2iVTrda8XW
# esPG62Mnn3T8AuLfzeJFuAbfOSERx7IFZO92UPoXE1uEjL5skl1yTZB3MubgOA4F
# 8KoRNhviFAEST+nG8c8uIsbZeb08SeYQMqjVEmkwggd6MIIFYqADAgECAgphDpDS
# AAAAAAADMA0GCSqGSIb3DQEBCwUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0
# ZSBBdXRob3JpdHkgMjAxMTAeFw0xMTA3MDgyMDU5MDlaFw0yNjA3MDgyMTA5MDla
# MH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMT
# H01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTEwggIiMA0GCSqGSIb3DQEB
# AQUAA4ICDwAwggIKAoICAQCr8PpyEBwurdhuqoIQTTS68rZYIZ9CGypr6VpQqrgG
# OBoESbp/wwwe3TdrxhLYC/A4wpkGsMg51QEUMULTiQ15ZId+lGAkbK+eSZzpaF7S
# 35tTsgosw6/ZqSuuegmv15ZZymAaBelmdugyUiYSL+erCFDPs0S3XdjELgN1q2jz
# y23zOlyhFvRGuuA4ZKxuZDV4pqBjDy3TQJP4494HDdVceaVJKecNvqATd76UPe/7
# 4ytaEB9NViiienLgEjq3SV7Y7e1DkYPZe7J7hhvZPrGMXeiJT4Qa8qEvWeSQOy2u
# M1jFtz7+MtOzAz2xsq+SOH7SnYAs9U5WkSE1JcM5bmR/U7qcD60ZI4TL9LoDho33
# X/DQUr+MlIe8wCF0JV8YKLbMJyg4JZg5SjbPfLGSrhwjp6lm7GEfauEoSZ1fiOIl
# XdMhSz5SxLVXPyQD8NF6Wy/VI+NwXQ9RRnez+ADhvKwCgl/bwBWzvRvUVUvnOaEP
# 6SNJvBi4RHxF5MHDcnrgcuck379GmcXvwhxX24ON7E1JMKerjt/sW5+v/N2wZuLB
# l4F77dbtS+dJKacTKKanfWeA5opieF+yL4TXV5xcv3coKPHtbcMojyyPQDdPweGF
# RInECUzF1KVDL3SV9274eCBYLBNdYJWaPk8zhNqwiBfenk70lrC8RqBsmNLg1oiM
# CwIDAQABo4IB7TCCAekwEAYJKwYBBAGCNxUBBAMCAQAwHQYDVR0OBBYEFEhuZOVQ
# BdOCqhc3NyK1bajKdQKVMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMAsGA1Ud
# DwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFHItOgIxkEO5FAVO
# 4eqnxzHRI4k0MFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwubWljcm9zb2Z0
# LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1dDIwMTFfMjAxMV8wM18y
# Mi5jcmwwXgYIKwYBBQUHAQEEUjBQME4GCCsGAQUFBzAChkJodHRwOi8vd3d3Lm1p
# Y3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dDIwMTFfMjAxMV8wM18y
# Mi5jcnQwgZ8GA1UdIASBlzCBlDCBkQYJKwYBBAGCNy4DMIGDMD8GCCsGAQUFBwIB
# FjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2RvY3MvcHJpbWFyeWNw
# cy5odG0wQAYIKwYBBQUHAgIwNB4yIB0ATABlAGcAYQBsAF8AcABvAGwAaQBjAHkA
# XwBzAHQAYQB0AGUAbQBlAG4AdAAuIB0wDQYJKoZIhvcNAQELBQADggIBAGfyhqWY
# 4FR5Gi7T2HRnIpsLlhHhY5KZQpZ90nkMkMFlXy4sPvjDctFtg/6+P+gKyju/R6mj
# 82nbY78iNaWXXWWEkH2LRlBV2AySfNIaSxzzPEKLUtCw/WvjPgcuKZvmPRul1LUd
# d5Q54ulkyUQ9eHoj8xN9ppB0g430yyYCRirCihC7pKkFDJvtaPpoLpWgKj8qa1hJ
# Yx8JaW5amJbkg/TAj/NGK978O9C9Ne9uJa7lryft0N3zDq+ZKJeYTQ49C/IIidYf
# wzIY4vDFLc5bnrRJOQrGCsLGra7lstnbFYhRRVg4MnEnGn+x9Cf43iw6IGmYslmJ
# aG5vp7d0w0AFBqYBKig+gj8TTWYLwLNN9eGPfxxvFX1Fp3blQCplo8NdUmKGwx1j
# NpeG39rz+PIWoZon4c2ll9DuXWNB41sHnIc+BncG0QaxdR8UvmFhtfDcxhsEvt9B
# xw4o7t5lL+yX9qFcltgA1qFGvVnzl6UJS0gQmYAf0AApxbGbpT9Fdx41xtKiop96
# eiL6SJUfq/tHI4D1nvi/a7dLl+LrdXga7Oo3mXkYS//WsyNodeav+vyL6wuA6mk7
# r/ww7QRMjt/fdW1jkT3RnVZOT7+AVyKheBEyIXrvQQqxP/uozKRdwaGIm1dxVk5I
# RcBCyZt2WwqASGv9eZ/BvW1taslScxMNelDNMYIZjzCCGYsCAQEwgZUwfjELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEoMCYGA1UEAxMfTWljcm9z
# b2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAxMQITMwAAAlKLM6r4lfM52wAAAAACUjAN
# BglghkgBZQMEAgEFAKCBrjAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgor
# BgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQguRd1No8E
# omunqkIVWtv7YIt55D2YK5694REITldZs5cwQgYKKwYBBAGCNwIBDDE0MDKgFIAS
# AE0AaQBjAHIAbwBzAG8AZgB0oRqAGGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbTAN
# BgkqhkiG9w0BAQEFAASCAQDDpXMmwq/tKWmkEnZ//a15UY7z6guCzrWacZWh8Okn
# kJhkpRQAaXswyAFzXElxS0vKfwcLNZvQqz9tXwqo9RK/j0EXUuSjm3gnjxxXfn5W
# UYTrdaqc8TQ6QGP2V/5NGUTYIFxM68NA+wfk9NsG1GXlp4QorIqV8KaQGLGqLABy
# 0jeFjO3bDBH4V947p9SePK7/W5JgwKZ16c7ZC0jV6s1fd9IH5Mx0qXfg4tXA/ZI6
# DS6xXjf8n7TWi8HQ9Iz6TeeAbyorJTMkEo82k9qotIVyXW3TJh4mKPoCk6nIXMD+
# 6ijsmfqgt1LvwpK2CYp8jvR/ct+MZ1KA8f+QBCksRqgNoYIXGTCCFxUGCisGAQQB
# gjcDAwExghcFMIIXAQYJKoZIhvcNAQcCoIIW8jCCFu4CAQMxDzANBglghkgBZQME
# AgEFADCCAVkGCyqGSIb3DQEJEAEEoIIBSASCAUQwggFAAgEBBgorBgEEAYRZCgMB
# MDEwDQYJYIZIAWUDBAIBBQAEINkDUQbsQkSpEhS/RwE9f8SoY/9sFnhJKfkTxiPv
# iunzAgZisxIBN3UYEzIwMjIwNjMwMDk1ODU3LjQ0NFowBIACAfSggdikgdUwgdIx
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1p
# Y3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEmMCQGA1UECxMdVGhh
# bGVzIFRTUyBFU046OEQ0MS00QkY3LUIzQjcxJTAjBgNVBAMTHE1pY3Jvc29mdCBU
# aW1lLVN0YW1wIFNlcnZpY2WgghFoMIIHFDCCBPygAwIBAgITMwAAAYguzcaBQeG8
# KgABAAABiDANBgkqhkiG9w0BAQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0Eg
# MjAxMDAeFw0yMTEwMjgxOTI3NDBaFw0yMzAxMjYxOTI3NDBaMIHSMQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQg
# SXJlbGFuZCBPcGVyYXRpb25zIExpbWl0ZWQxJjAkBgNVBAsTHVRoYWxlcyBUU1Mg
# RVNOOjhENDEtNEJGNy1CM0I3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFt
# cCBTZXJ2aWNlMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAmucQCAQm
# kcXHyDrV4S88VeJg2XGqNKcWpsrapRKFWchhjLsf/M9XN9bgznLN48BXPAtOlwoe
# dB2kN4bZdPP3KdRNbYq1tNFUh8UnmjCCr+CjLlrigHcmS0R+rsN2gBMXlLEZh2W/
# COuD9VOLsb2P2jDp433V4rUAAUW82M7rg81d3OcctO+1XW1h3EtbQtS6QEkw6DYI
# uvfX7Aw8jXHZnsMugP8ZA1otprpTNUh/zRWC7CJyBzymQIDSCdWhVfD4shxe+Rs6
# 1axf27bTg5H/V/SkNd9hzM6Nq/y2OjDKrLtuN9hS53569uhTNQeAhAVDfeHpEzlM
# vtXOyX6MTme3jnHdHPj6GLT9AMRIrAf96hPYOiPEBvHtrg6MpiI3+l6NlbSOs16/
# FTeljT1+sdsWGtFTZvea9pAqV1aB795aDkmZ6sRm5jtdnVazfoWrHd3vDeh35WV0
# 8vW4TlOfEcV2+KbairPxaFkJ4+tlsJ+MfsVOiTr/ZnDgaMaHnzzogelI3AofDU9I
# TbMkTtTxrLPygTbRdtbptrnLzBn2jzR4TJfkQo+hzWuaMu5OtMZiKV2I5MO0m1mK
# uUAgoq+442Lw8CQuj9EC2F8nTbJb2NcUDg+74dgJis/P8Ba/OrlxW+Trgc6TPGxC
# OtT739UqeslvWD6rNQ6UEO9f7vWDkhd2vtsCAwEAAaOCATYwggEyMB0GA1UdDgQW
# BBRkebVQxKO7zru9+o27GjPljMlKSjAfBgNVHSMEGDAWgBSfpxVdAF5iXYP05dJl
# pxtTNRnpcjBfBgNVHR8EWDBWMFSgUqBQhk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpb3BzL2NybC9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIwMjAx
# MCgxKS5jcmwwbAYIKwYBBQUHAQEEYDBeMFwGCCsGAQUFBzAChlBodHRwOi8vd3d3
# Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMFRpbWUtU3Rh
# bXAlMjBQQ0ElMjAyMDEwKDEpLmNydDAMBgNVHRMBAf8EAjAAMBMGA1UdJQQMMAoG
# CCsGAQUFBwMIMA0GCSqGSIb3DQEBCwUAA4ICAQBAEFrb+1gIJsv/GKLS2zavm2ek
# 177mk4yu6BuS6ViIuL0e20YN2ddXeiUhEdhk3FRto/GD93k5SIyNJ6X+p8uQMOxI
# 23YOSdyEzLJwh7+ftu0If8y3x6AJ0S1d12OZ7fsYqljHUeccneS9DWqipHk8uM8m
# 2ZbBhRnUN8M4iqg4roJGmZKZ9Fc8Z7ZHJgM97i7fIyA9hJH017z25WrDJlxapD5d
# mMyNyzzfAVqaByemCoBn4VkRCGNISx0xRlcb93W6ENhJF1NBjMl3cKVEHW4d8Y0N
# ZhpdXDteLk9HgbJyeCI2fN9GBrCS1B1ak+194PGiZKL8+gtK7NorAoAMQvFkYgrH
# rWCYfjV6PouC3N+A6wOBrckVOHT9PUIDK5ADCH4ZraQideS9LD/imKHM3I4iazPk
# ocHcFHB9yo5d9lMJZ+pnAAWglQQjMWhUqnE/llA+EqjbO0lAxlmUtVioVUswhT3p
# K6DjFRXM/LUxwTttufz1zBjELkRIZ8uCy1YkMxfBFwEos/QFIlDaFSvUn4IiWZA3
# VLfAEjy51iJwK2jSIHw+1bjCI+FBHcCTRH2pP3+h5DlQ5AZ/dvcfNrATP1wwz25I
# r8KgKObHRCIYH4VI2VrmOboSHFG79JbHdkPVSjfLxTuTsoh5FzoU1t5urG0rwulo
# ZZFZxTkrxfyTkhvmjDCCB3EwggVZoAMCAQICEzMAAAAVxedrngKbSZkAAAAAABUw
# DQYJKoZIhvcNAQELBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5n
# dG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBSb290IENlcnRpZmljYXRlIEF1dGhv
# cml0eSAyMDEwMB4XDTIxMDkzMDE4MjIyNVoXDTMwMDkzMDE4MzIyNVowfDELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAw
# ggIKAoICAQDk4aZM57RyIQt5osvXJHm9DtWC0/3unAcH0qlsTnXIyjVX9gF/bErg
# 4r25PhdgM/9cT8dm95VTcVrifkpa/rg2Z4VGIwy1jRPPdzLAEBjoYH1qUoNEt6aO
# RmsHFPPFdvWGUNzBRMhxXFExN6AKOG6N7dcP2CZTfDlhAnrEqv1yaa8dq6z2Nr41
# JmTamDu6GnszrYBbfowQHJ1S/rboYiXcag/PXfT+jlPP1uyFVk3v3byNpOORj7I5
# LFGc6XBpDco2LXCOMcg1KL3jtIckw+DJj361VI/c+gVVmG1oO5pGve2krnopN6zL
# 64NF50ZuyjLVwIYwXE8s4mKyzbnijYjklqwBSru+cakXW2dg3viSkR4dPf0gz3N9
# QZpGdc3EXzTdEonW/aUgfX782Z5F37ZyL9t9X4C626p+Nuw2TPYrbqgSUei/BQOj
# 0XOmTTd0lBw0gg/wEPK3Rxjtp+iZfD9M269ewvPV2HM9Q07BMzlMjgK8QmguEOqE
# UUbi0b1qGFphAXPKZ6Je1yh2AuIzGHLXpyDwwvoSCtdjbwzJNmSLW6CmgyFdXzB0
# kZSU2LlQ+QuJYfM2BjUYhEfb3BvR/bLUHMVr9lxSUV0S2yW6r1AFemzFER1y7435
# UsSFF5PAPBXbGjfHCBUYP3irRbb1Hode2o+eFnJpxq57t7c+auIurQIDAQABo4IB
# 3TCCAdkwEgYJKwYBBAGCNxUBBAUCAwEAATAjBgkrBgEEAYI3FQIEFgQUKqdS/mTE
# mr6CkTxGNSnPEP8vBO4wHQYDVR0OBBYEFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMFwG
# A1UdIARVMFMwUQYMKwYBBAGCN0yDfQEBMEEwPwYIKwYBBQUHAgEWM2h0dHA6Ly93
# d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0b3J5Lmh0bTATBgNV
# HSUEDDAKBggrBgEFBQcDCDAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNV
# HQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBTV9lbLj+iiXGJo
# 0T2UkFvXzpoYxDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29m
# dC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5j
# cmwwWgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jv
# c29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNydDAN
# BgkqhkiG9w0BAQsFAAOCAgEAnVV9/Cqt4SwfZwExJFvhnnJL/Klv6lwUtj5OR2R4
# sQaTlz0xM7U518JxNj/aZGx80HU5bbsPMeTCj/ts0aGUGCLu6WZnOlNN3Zi6th54
# 2DYunKmCVgADsAW+iehp4LoJ7nvfam++Kctu2D9IdQHZGN5tggz1bSNU5HhTdSRX
# ud2f8449xvNo32X2pFaq95W2KFUn0CS9QKC/GbYSEhFdPSfgQJY4rPf5KYnDvBew
# VIVCs/wMnosZiefwC2qBwoEZQhlSdYo2wh3DYXMuLGt7bj8sCXgU6ZGyqVvfSaN0
# DLzskYDSPeZKPmY7T7uG+jIa2Zb0j/aRAfbOxnT99kxybxCrdTDFNLB62FD+Cljd
# QDzHVG2dY3RILLFORy3BFARxv2T5JL5zbcqOCb2zAVdJVGTZc9d/HltEAY5aGZFr
# DZ+kKNxnGSgkujhLmm77IVRrakURR6nxt67I6IleT53S0Ex2tVdUCbFpAUR+fKFh
# bHP+CrvsQWY9af3LwUFJfn6Tvsv4O+S3Fb+0zj6lMVGEvL8CwYKiexcdFYmNcP7n
# tdAoGokLjzbaukz5m/8K6TT4JDVnK+ANuOaMmdbhIurwJ0I9JZTmdHRbatGePu1+
# oDEzfbzL6Xu/OHBE0ZDxyKs6ijoIYn/ZcGNTTY3ugm2lBRDBcQZqELQdVTNYs6Fw
# ZvKhggLXMIICQAIBATCCAQChgdikgdUwgdIxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJh
# dGlvbnMgTGltaXRlZDEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046OEQ0MS00QkY3
# LUIzQjcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2WiIwoB
# ATAHBgUrDgMCGgMVAOE8isx8IBeVPSweD805l5Qdeg5CoIGDMIGApH4wfDELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwDQYJKoZIhvcNAQEFBQACBQDmZ3NvMCIY
# DzIwMjIwNjMwMDg1NzE5WhgPMjAyMjA3MDEwODU3MTlaMHcwPQYKKwYBBAGEWQoE
# ATEvMC0wCgIFAOZnc28CAQAwCgIBAAICEtUCAf8wBwIBAAICETMwCgIFAOZoxO8C
# AQAwNgYKKwYBBAGEWQoEAjEoMCYwDAYKKwYBBAGEWQoDAqAKMAgCAQACAwehIKEK
# MAgCAQACAwGGoDANBgkqhkiG9w0BAQUFAAOBgQATV3QyahkPs611VGcC+GWOt5PS
# teJcrMdHQSd0dcxc/aVawe296eJTHxjQSwo4rtrpZc5jQFYVkDJkDqGHdK87yyyz
# bPzDp7AT7XDKymV2yaDzMUmwRSN1NMiPOak3kwnjepV/eqFx/94ZCwqRHoxNsqAg
# 25bcDwpQf7zXsekE4TGCBA0wggQJAgEBMIGTMHwxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1w
# IFBDQSAyMDEwAhMzAAABiC7NxoFB4bwqAAEAAAGIMA0GCWCGSAFlAwQCAQUAoIIB
# SjAaBgkqhkiG9w0BCQMxDQYLKoZIhvcNAQkQAQQwLwYJKoZIhvcNAQkEMSIEIKHV
# 41yofObDs095tJrmnOB3vJhc0gJ1QSo9D9/CgtEgMIH6BgsqhkiG9w0BCRACLzGB
# 6jCB5zCB5DCBvQQgZune7awGN0aEgvjP7JyO3NKl7hstX8ChhrKmXtJJQKUwgZgw
# gYCkfjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYD
# VQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAYguzcaBQeG8
# KgABAAABiDAiBCAr65sEaeQKOCYp4gM+r4r8DsqSud/afxm4oRmuyTFyfDANBgkq
# hkiG9w0BAQsFAASCAgCFx0pPwoVuR6ROKlwhVMOjj/lDKOLllBn3RndEtTwrM6dX
# JNm7SxSfeeHXN2vNpWRo1PvJnfgtM4bqCuel+Nm9tQBktkPoNMNBin1N8sIX7EP6
# TNy2ezRQXLk7P13dypQTZAG6dsKeU+YZLzW1ZgtzmrmQudV95rBjsCQ0OcpRJW3w
# Fv8tTq0+/MBH7CGQoNHAxavH8hBcZfs3CFEDRz5odmQjvIWxZTXvoFzX8l4ZF00Z
# J/TuiNyCx0Z9Z6e/mw/YEnWLJF7ckgV8HJf9LRzkPWU4VOV+Gw0pZ1/+FesFh4vx
# JuAaZgeOK5VTa2WWhzcJNQLWe4a9D2Qd2hqhfPpK0CN2RkK7gm2FR29YE4ShYb6Y
# WJ45/JyVtlBq0Wm4mRhVR3ppmOgfAfDxh+wX1hiphDXtK0YR6Gpedo2bVJ4+wZJl
# D+iAx3NTsiu+OJ01xE5uwnw25RHtGudrEBzxLu15d1hhqL+PumQd7owM0bQfF50g
# ecNCqupcj7m/xVWwKfV/YyAEYTevNLd9fivGUmZrQxgy7f/02iC7JV6ib0qutTjS
# ClBJIX/SaPKzJ0dj4dGsouzJx2itVca0hfhxdlNzGEUXyK6eaLpWpq/j8Rkw0dK9
# /pJwH68Oyl7LgJ5Lh8GCa+uKnBVQdI4zxxQmOTm62Bc78Gm/09sN5X+rd+AOdw==
# SIG # End signature block
