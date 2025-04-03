# hp-touchscreen.ps1
#
# This script provides a simple way to enable or disable the touchscreen functionality
# on HP laptops that support HID-compliant touch screens. It uses PowerShell cmdlets
# to interact with the device manager, enabling or disabling the touchscreen device
# based on the provided action ('enable' or 'disable').
#
# Usage:
#   - To enable the touchscreen:   ./hp-touchscreen.ps1 enable
#   - To disable the touchscreen:  ./hp-touchscreen.ps1 disable
#
# The script works by fetching the device information for the "HID-compliant touch screen",
# checking its current status, and then either enabling or disabling the device accordingly.
# If the device is already in the desired state, it outputs an appropriate message.
#
# Note: If the device is not found, the script will output "Touchscreen device not found."
#
# Requirements:
#   - PowerShell 5.1 or higher.
#   - Administrator privileges may be required to modify device statuses.
#   - To ensure the script can run properly, you might need to change the execution policy by running the following command:
#
#       Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
#
#     This command sets the execution policy for PowerShell scripts in the current user's environment, 
#     allowing local scripts to run, while requiring downloaded scripts to be signed by a trusted publisher. 
#     This change only affects the current user and will not modify system-wide settings.


param (
    [string]$action
)

$deviceName = "HID-compliant touch screen"

# Fetch devices
$devices = Get-PnpDevice | Where-Object { $_.FriendlyName -like "*$deviceName*" }

if ($devices) {
    foreach ($device in $devices) {
        $status = $device.Status
        
        if ($action -eq "enable") {
            if ($status -eq "OK") {
                Write-Output "Touchscreen is already enabled."
            } else {
                Enable-PnpDevice -InstanceId $device.InstanceId -Confirm:$false
                Write-Output "Touchscreen enabled."
            }
        } elseif ($action -eq "disable") {
            if ($status -ne "OK") {
                Write-Output "Touchscreen is already disabled."
            } else {
                Disable-PnpDevice -InstanceId $device.InstanceId -Confirm:$false
                Write-Output "Touchscreen disabled."
            }
        } else {
            Write-Output "Invalid action. Use 'enable' or 'disable'."
        }
    }
} else {
    Write-Output "Touchscreen device not found."
}