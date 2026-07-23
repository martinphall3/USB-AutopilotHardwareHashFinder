# USB-AutopilotHardwareHashFinder

A modified version of Michael Niehaus's PowerShell script that generates Windows Autopilot hardware hashes (HWIDs) and saves them directly to a USB drive for later import into Microsoft Intune.

## Why?

These scripts are intended for environments where devices are **not yet enrolled in Microsoft Intune or Windows Autopilot** and you need a simple way to collect hardware hashes without relying on a network file share like the original script does.

These scripts collect each device's hardware hash into an individual CSV file stored on the USB. The CSV files can then be imported into the Windows Autopilot Devices interface in Microsoft Intune.

## Folder Structure

Create the following structure on your USB drive:

```
USB Drive
│
├── Get-WindowsAutopilotInfo.ps1
├── HWID.cmd
└── Hashes
```

The `Hashes` folder is where the generated CSV files will be stored.

---

## How to Use

1. Download the repository.

2. Extract the following files to the USB drive:

   - `Get-WindowsAutopilotInfo.ps1`
   - `HWID.cmd`

3. Create a folder named: Hashes

4. Edit `HWID.cmd` if necessary.

5. Run `HWID.cmd`.

6. After the script completes, a CSV file will be created in:

```
USB Drive
│
└── Hashes
```

8. Repeat the process for as many devices as you need.

---

## Running During Windows OOBE

These scripts were intended to be used before a device has been configured.

1. Boot the device to the Windows Out-of-Box Experience (OOBE).

2. Press: Shift + F10 (or, on some laptops, Shift + Fn + F10) to open Command Prompt.

3. Navigate to the USB drive.

4. Run: HWID.cmd

5. The hardware hash will be saved to the `Hashes` folder on the USB drive.

This allows hardware hashes to be collected before a user account is created. Afterwards, you can import the files into Microsoft Intune to be used for Autopilot.

## Bonus: Combine Multiple CSV Files

If you have many `.csv` files:

1. Run `combiner.ps1`.

2. The combined output will be saved as `combined.csv` in the same directory as `combiner.ps1`.
