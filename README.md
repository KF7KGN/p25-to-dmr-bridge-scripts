

---

# p25-to-dmr-bridge-scripts

**Scripts to easily set up and manage a P25 to DMR bridge.**

This repository contains scripts designed to automate the setup and management of a P25 to DMR bridge, making the process accessible even for those with minimal technical experience. These scripts are intended to be used alongside the Zion Digital Link tutorial.

## Features

- **Automated Install Script**: Simplifies the installation process by guiding you through each step, ensuring that all required software and configurations are correctly set up.
- **Restart Script**: Provides a quick way to stop and restart all necessary services, making it easy to manage and test your P25 to DMR bridge.
- **Beginner-Friendly**: Detailed instructions and explanations are included, so even users with no prior experience can successfully set up and manage the bridge.

## Requirements

- A Linux-based server (Debian or Ubuntu recommended)
- Basic knowledge of SSH and command-line operations
- Internet connection for downloading dependencies

## Installation

1. **Clone the Repository:**

   git clone https://github.com/KF7KGN/p25-to-dmr-bridge-scripts.git
   cd p25-to-dmr-bridge-scripts

2. **Run the Install Script:**

   sudo bash install_p25_to_dmr.sh

   - The script will prompt you to enter your callsign and other necessary details.
   - It will then proceed to install all required software and set up the configuration files.

3. **Run the Restart Script (if needed):**

   sudo bash restart_p25_to_dmr.sh

   - This script will stop all relevant services, apply any updates, and restart them, ensuring your bridge is running smoothly.

## How to Use

- **Monitoring**: Each service runs in a separate `screen` session, allowing you to monitor the output and check for any errors. Use the following command to reattach to a `screen` session:
  
  screen -r <session_name>

- **Log Files**: Log files are stored in the `/var/log/p25_to_dmr` directory. Check these logs to troubleshoot any issues with the bridge.

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests to improve the scripts or add new features.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Author

Nathan Hayes (KF7KGN)

---


