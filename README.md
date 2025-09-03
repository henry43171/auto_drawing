# Auto Drawing Tools

This repository contains lightweight automation tools for managing daily drawing tasks. The goal is to reduce repetitive steps and help maintain a consistent drawing practice.

## Files

- `auto_urls.bat`  
  Opens a set of predefined websites for reference. URLs are read from `urls.txt`.

- `auto_csp.bat`  
  Creates a new Clip Studio Paint (CSP) file based on a template and opens it. Also opens a materials folder. Configuration is read from `config_csp.txt`.

- `urls.txt`  
  Contains the list of URLs to open with `auto_urls.bat`.

- `config_csp.txt`  
  Stores configuration for CSP automation, including template path, target folder, file prefix, and materials folder path.

## Usage

1. Adjust `urls.txt` and `config_csp.txt` according to your needs.
2. Run the desired batch file (`auto_urls.bat` or `auto_csp.bat`) to perform automation.
3. CSP files will be created with a date-based filename to avoid overwriting previous work.

## Notes

- Ensure all paths are valid. Using non-English characters in file paths may cause issues with batch execution.
- These tools are lightweight and intended for personal daily use.
- The batch files include simple safeguards to prevent accidental overwrites.
