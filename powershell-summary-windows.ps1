# Get operating system information
$os = Get-WmiObject -Class Win32_OperatingSystem

# Get computer system information
$sys = Get-WmiObject -Class Win32_ComputerSystem

# Get BIOS information
$bios = Get-WmiObject -Class Win32_BIOS

# Get IP address information
$ip = Get-NetIPAddress -AddressFamily IPv4 | Select-Object -First 1

# Get processor information
$proc = Get-WmiObject -Class Win32_Processor

# Get disk space information
$disks = Get-WmiObject -Class Win32_LogicalDisk

# Output system information
"Operating System: $($os.Caption)"
"Computer Name: $($sys.Name)"
"Number of Processors: $($sys.NumberOfProcessors)"
"Total Physical Memory: $([Math]::Round($sys.TotalPhysicalMemory/1GB)) GB"
"BIOS Version: $($bios.SMBIOSBIOSVersion)"

# Output IP address information
"IPv4 Address Information:"
"  Address: $($ip.IPAddress)"
"  InterfaceAlias: $($ip.InterfaceAlias)"
"  InterfaceIndex: $($ip.InterfaceIndex)"
"  PrefixLength: $($ip.PrefixLength)"
"  AddressFamily: $($ip.AddressFamily)"
"  Type: $($ip.Type)"

# Output processor information
"Processor Information:"
"  Name: $($proc.Name)"
"  Manufacturer: $($proc.Manufacturer)"
"  Number of Cores: $($proc.NumberOfCores)"
"  Number of Logical Processors: $($proc.NumberOfLogicalProcessors)"
"  Max Clock Speed: $($proc.MaxClockSpeed) MHz"

# Output disk space information
"Disk Space Information:"
foreach($disk in $disks) {
    "  Disk: $($disk.DeviceID)"
    "    Size: $([Math]::Round($disk.Size/1GB)) GB"
    "    Free Space: $([Math]::Round($disk.FreeSpace/1GB)) GB"
    "    File System: $($disk.FileSystem)"
    "    Drive Type: $($disk.DriveType)"
}

