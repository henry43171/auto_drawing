# Auto Drawing Tools

This repository contains lightweight automation tools for managing daily drawing tasks.  
The goal is to reduce repetitive steps and help maintain a consistent drawing practice.

## Files

- `auto_urls.bat`  
  Opens a set of predefined websites for reference.  
  Configuration is read from `config/urls.txt` (copied from the example in `config_example/`).

- `auto_csp.bat`  
  Creates a new Clip Studio Paint (CSP) file based on a template and opens it.  
  Also opens a materials folder.  
  Configuration is read from `config/config_csp.txt` (copied from the example in `config_example/`).

- `config_example/`  
  Contains sample configuration files (`urls.txt`, `config_csp.txt`) that serve as templates.  
  Copy them into a `config/` folder and adjust to your own environment.

## Usage

1. Copy the example configs from `config_example/` into a new folder called `config/`.  
2. Edit the configs in `config/` according to your needs.  
3. Run the desired batch file (`auto_urls.bat` or `auto_csp.bat`) to perform automation.  
4. CSP files will be created with a date-based filename to avoid overwriting previous work.

## Notes

- Ensure all paths are valid. Using non-English characters in file paths may cause issues with batch execution.  
- These tools are lightweight and intended for personal daily use.  
- The batch files include simple safeguards to prevent accidental overwrites.