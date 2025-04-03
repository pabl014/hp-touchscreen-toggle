# HP Touchscreen Toggle Script

This PowerShell script provides a simple and efficient way to **enable** or **disable** the touchscreen functionality on **HP laptops** with **HID-compliant touch screens**. It utilizes PowerShell cmdlets to interact with the Device Manager, enabling or disabling the touchscreen device based on the provided action (`enable` or `disable`).

## Features

- **Enable** or **disable** the touchscreen with a simple command.
- Automatically checks the current state of the touchscreen and only takes action if needed.
- Provides feedback if the device is already in the desired state (enabled or disabled).
- A fast and easy solution to toggle touchscreen functionality without navigating through Device Manager or using more complex methods.

## Requirements

- **PowerShell 5.1** or higher is required to run the script.
- **Administrator privileges** may be required to modify the device status (enable/disable).
- To ensure the script can run properly, you might need to change the execution policy by running the following command:

    ```powershell
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    ```

    This command sets the execution policy for PowerShell scripts in the current user's environment, allowing local scripts to run, while requiring downloaded scripts to be signed by a trusted publisher. This change only affects the current user and will not modify system-wide settings. 

    If you want to prevent the execution of any scripts, you can reset it back to the default policy with:

    ```powershell
    Set-ExecutionPolicy Restricted -Scope CurrentUser
    ```

    **Note**: Using `Set-ExecutionPolicy Restricted` will prevent running any PowerShell scripts, including this one.

## Usage

To use the script, open PowerShell and run the following commands:

### Enable the touchscreen
```powershell
./hp-touchscreen.ps1 enable
```
**Output:** Touchscreen enabled.

### Disable the touchscreen
```powershell
./hp-touchscreen.ps1 disable
```
**Output:** Touchscreen disabled.

## Example

### Enable the touchscreen
```powershell
./hp-touchscreen.ps1 enable
```
**Output:** Touchscreen enabled.

### Disable the touchscreen
```powershell
./hp-touchscreen.ps1 disable
```
**Output:** Touchscreen disabled.

### Handle unknown commands
If an invalid action is provided (neither `enable` nor `disable`), the script will output the following message:

```powershell
./hp-touchscreen.ps1 unknownCommand
```
**Output:** Invalid action. Use 'enable' or 'disable'.
