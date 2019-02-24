# Environment Helpers

PowerShell Helper scripts to add/update/remove environment helpers for aspnet core, repositories, custom variables.

## Getting Started

* Copy the files
* Open Command Line or PowerShell (*Window + X, A*)
* If you opened Command Prompt, then type *powershell* in order to use PowerShell commands
* Navigate to the scripts directory <br />`cd your_directory`
* Type <br />`Import-Module .\EnvironmentVariables.psm1`
* Now you can use the methods from your PowerShell session

### Adding Script to Profile [Optional]

* Navigate to the profile path <br />`cd (Split-Path -parent $PROFILE)`
* Open the location in Explorer <br />`ii .`
* Create the user profile if it does not exist <br />`If (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }`
* Import the module in the PowerShell profile <br />`Import-Module -Path script_directory -ErrorAction SilentlyContinue`

### Examples

#### Set-Repository-EnvVariable Examples
Adds Repository details to user environment variables.
<details>
   <summary>Prompt for details</summary>
   <p>Set-Repository-EnvVariable</p>
</details>
<details>
   <summary>Specify details</summary>
   <p>Set-Repository-EnvVariable -Name 'RepositoryName' -RemoteUrl 'https://github.com/jhonnyelhelou91/EnvironmentVariables.git' -LocalPath 'C:\git\PowerShell\EnvironmentHelpers\'</p>
</details>


#### Set-AspNetCore-EnvVariable Examples
Set the *ASPNETCORE_ENVIRONMENT* environment variable.
<details>
   <summary>Set to default</summary>
   <p>Set-AspNetCore-EnvVariable</p>
</details>
<details>
   <summary>Specify value</summary>
   <p>Set-AspNetCore-EnvVariable -Value 'Production'</p>
</details>


#### Set-EnvVariable Examples
Create or Update environment variable.
<details>
   <summary>Prompt for details</summary>
   <p>Set-EnvVariable -Name 'MyVariable' -Prompt $true</p>
</details>
<details>
   <summary>Add Environment Variable with *name* and *value* for *current user*</summary>
   <p>Set-EnvVariable -Name 'MyVariable' -Value 'MyValue'</p>
</details>
<details>
   <summary>Add Environment Variable with *name* and *value* for *current machine*</summary>
   <p>Set-EnvVariable -Name 'MyVariable' -Value 'MyValue' -Target 'Machine'</p>
</details>
<details>
   <summary>Add Environment Variable with *name* and *value* for *current process*</summary>
   <p>Set-EnvVariable -Name 'MyVariable' -Value 'MyValue' -Target 'Process'</p>
</details>


#### Set-BuildPath-EnvVariable Examples
Set the *Dev.MSBuildPath* environment variable.
<details>
   <summary>Set to default (Path for Build Tools 2017)</summary>
   <p>Set-BuildPath-EnvVariable</p>
</details>
<details>
   <summary>Specify value</summary>
   <p>Set-BuildPath-EnvVariable -Value 'C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\msbuild.exe'</p>
</details>
