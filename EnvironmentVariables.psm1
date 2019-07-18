$ErrorActionPreference = "Stop"
function Set-Repository-EnvVariable {
Param(
	[Parameter(Mandatory=$false)]
	[string]
	$name = (Read-Host -Prompt "Name"),
	
	[Parameter(Mandatory=$false)]
	[string]
	$remoteUrl = (Read-Host -Prompt "Remote Url"),
	
	[Parameter(Mandatory=$false)]
	[string]
	$localPath = (Read-Host -Prompt "Local Path")
);
	Set-EnvVariable -name "Dev.Repository_$name.Name" -target "User" -value $name -prompt $false;
	Set-EnvVariable -name "Dev.Repository_$name.RemoteUrl" -target "User" -value $remoteUrl -prompt $false;
	Set-EnvVariable -name "Dev.Repository_$name.Path" -target "User" -value $localPath -prompt $false;
}
function Set-AspNetCore-EnvVariable {
Param(
	[Parameter(Mandatory=$false)]
	[string]
	$value = "Development"
);	
	Set-EnvVariable -name "ASPNETCORE_ENVIRONMENT" -target "Machine" -value $value -prompt $false;
}

function Clear-EnvVariable {
Param(
	[Parameter(Mandatory=$false)]
	[string]
	$pattern = "Env:Dev.*"
);
	# Remove all Dev environment variables
    $old_variables = Get-Item $pattern;
    foreach ($variable in $old_variables) {
        [Environment]::SetEnvironmentVariable($variable.name, $null, [System.EnvironmentVariableTarget]::User);
		Write-Host "Environment Variable $($variable.name) removed";
    }
    #Refresh environment variables
    RefreshEnv;
}
function Set-EnvVariable {
Param(
	[Parameter(Mandatory=$true)]
	[string]
	$name,
	[Parameter(Mandatory=$false)]
	[ValidateSet('Machine', 'User', 'Process')]
	[string]
	$target = "User",
	[Parameter(Mandatory=$false)]
	[string]
	$value = $null,
	[boolean]
	$prompt
);
	If ([string]::IsNullOrEmpty($value)) {
		$value = Invoke-Command -ErrorAction SilentlyContinue -Command {
			[Environment]::GetEnvironmentVariable($name, $target);
		};
	}
	
	If ($prompt -eq $true) {
		$newValue = Read-Host -Prompt "$name (values to $value)";
	}
	
	If ([string]::IsNullOrEmpty($newValue)) {
		$value = $newValue;
	}
	Write-Host "Env Variable $name was set to $value"
	[Environment]::SetEnvironmentVariable($name, $value, $target);
    	#Refresh environment variables
    	RefreshEnv;
}
function Set-BuildPath-EnvVariable {
Param(
	[Parameter(Mandatory=$false)]
	[string]
	$value = "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\MSBuild\15.0\Bin\msbuild.exe"
);
	If (Test-Path $value) {
		$value = $value;
	}
	
	Set-EnvVariable -Name "Dev.MSBuildPath" -Target "User" -Value $value;
}

Export-ModuleMember -Function Set-Repository-EnvVariable
Export-ModuleMember -Function Set-AspNetCore-EnvVariable
Export-ModuleMember -Function Set-BuildPath-EnvVariable
Export-ModuleMember -Function Set-EnvVariable
Export-ModuleMember -Function Clear-EnvVariable
