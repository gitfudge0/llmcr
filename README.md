# Pre-commit Code Review scripts

This code is a Node.js script designed to automate the process of reviewing code changes between two commits using an AI language model. Use your desired methods to trigger the script in your pre-commit hook.

## Usage

To use this tool:

- Ensure you have Node.js installed.
- Make sure the AI language model server is running at `http://localhost:11434/api/generate?`.
- Execute the script with `node review.js` or get it executed via the pre-commit hook
- Check the `code_review` directory

This script is a useful starting point for automating code reviews but can be extended and improved further based on specific needs.
