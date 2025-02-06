# Code Review and Improvement Tool

This code is a Node.js script designed to automate the process of reviewing code changes between two commits using an AI language model. Here's how it works:

## Overview

1. **Fixed Prompt**: The script starts with a fixed prompt that instructs the AI model on its role, purpose, and format for the response.
2. **Git Diff Execution**: The `executeGitDiffCommand` function runs the `git diff` command to fetch the changes made between the last two commits.
3. **Sending Request**: The script sends a POST request to an API endpoint (`http://localhost:11434/api/generate?`) with the prompt containing the code changes.
4. **Response Handling**: Upon receiving the response from the API, the script logs it to the console.

## Usage

To use this tool:

- Ensure you have Node.js installed.
- Run `npm install` to install dependencies.
- Make sure the AI language model server is running at `http://localhost:11434/api/generate?`.
- Execute the script with `node scriptName.js`.

This script is a useful starting point for automating code reviews but can be extended and improved further based on specific needs.
