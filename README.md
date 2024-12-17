# Log Analyzer with Threat Intelligence Integration

## Overview
This project implements a simple **Log Analyzer** in the D programming language. The program scans system logs and compares the entries against predefined threat intelligence stored in a JSON file. It generates alerts when potential threats are detected, providing real-time monitoring and threat detection capabilities.

---

## Features
- Loads threat intelligence from a `threats.json` file.
- Analyzes logs from a `system_logs.txt` file.
- Detects threat indicators and generates real-time alerts.
- Customizable threat intelligence and log file locations.
- Provides detailed alerts with timestamps, threat descriptions, and severity levels.

---

## Requirements
### System Requirements
- Operating System: **Linux** or **macOS** (for optimal raw socket functionality).
- Administrative privileges may be required depending on network monitoring setup.

### Software Requirements
- **D Compiler**: [DMD](https://dlang.org/download.html) or equivalent.
- **Visual Studio Code** (optional) with the following extensions:
  - `code-d` (D language support)
  - `dlang-dcd` (optional for autocomplete and debugging support)

---

## Installation
### Steps
1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
Install D Compiler: Download and install the DMD compiler from here.

Compile the Program: Use the DMD compiler to build the program:

bash
Copy code
dmd log_analyzer.d -o-
Run the Program: Run the compiled program:

bash
Copy code
./log_analyzer
Usage
The program will:

Load threat intelligence from threats.json.
Analyze logs from system_logs.txt and print any detected threats.
Sample Output:
plaintext
Copy code
Starting Real-Time Alert System...
Loading Threat Intelligence...
Threat Intelligence Loaded: 3 entries.
Analyzing Logs...
ALERT: Threat Detected at 2024-12-17T12:20:00+00:00
  Indicator: failed login
  Description: Unauthorized Login Attempt
  Severity: LOW

ALERT: Threat Detected at 2024-12-17T12:25:00+00:00
  Indicator: error
  Description: System Error Detected
  Severity: CRITICAL
Stopping the Program
Use CTRL+C to terminate the program.

Code Structure
Main Components
Threat Intelligence Loading:
Reads threat indicators from the threats.json file.
Log Analysis:
Scans each entry in the system_logs.txt file for threat indicators.
Alert Generation:
Generates alerts with timestamps, severity, and detailed descriptions of the threat.
Error Handling:
Gracefully handles file reading errors and missing threat indicators.
Function: parseLogs()
This function scans through the logs and checks for any matches with the threat intelligence data:

Compares log entries with the defined indicators.
Generates and prints alerts when matches are found.
Limitations
Platform Dependence: The program is designed for Linux/macOS and may require modifications for Windows compatibility.
Basic Detection: Currently, the program only detects specific threat indicators as defined in the threats.json file. It doesn't include advanced detection techniques such as pattern recognition or machine learning.
Permissions: Ensure appropriate permissions to read log files and analyze them.
Future Enhancements
Integrate with a more dynamic threat intelligence source.
Add support for more complex log formats (e.g., JSON, XML).
Implement an alerting system (e.g., email notifications).
Develop a web interface to visualize detected threats and generate reports.
Troubleshooting
File Not Found:
Ensure that the threats.json and system_logs.txt files are present in the project directory.
Permission Denied:
Check that you have read access to the log files and write access for generating output.
Compilation Errors:
Ensure that the DMD compiler is properly installed and the D source files are correctly referenced.
License
This project is licensed under the MIT License. You are free to use, modify, and distribute the code as per the license terms.

Acknowledgments
D Programming Language for its efficient and expressive features.
The concept of threat intelligence and log analysis from the cybersecurity community.
Contact
For any issues or contributions, feel free to open an issue or contact the repository maintainer.

Happy Coding!

vbnet
Copy code

This structure includes all the sections you're looking for, including installation, usage, code structure, limitations, enhancements, troubleshooting, and licensing. You can copy and paste this into your `README.md`.





