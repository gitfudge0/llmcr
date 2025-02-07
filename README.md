# LLM Code Review scripts

This script is designed to automate the process of reviewing code changes between two commits BEFORE pushing to remote using a local AI language model. Use your desired methods to trigger the script in your pre-commit hook.

## Usage

To use this tool:

- Ensure you have Node.js installed.
- Make sure the AI language model server is running at `http://localhost:11434/api/generate?`.
- Execute the script with `node review.js` or get it executed via the pre-commit hook
- Check the `code_review` directory

Add a pre-commit hook to your repository to automate checks before you commit your code. Here’s how you can do it:

1. Create a new file named `pre-commit` in the `.git/hooks` directory and make it an executable:

   ```bash
   touch .git/hooks/pre-commit
   chmod +x .git/hooks/pre-commit
   ```

2. Add the following content to the `pre-commit` file. This example script will run `npm test` before you commit:

   ```bash
   #!/bin/sh
   echo "Generating code review..."
   npm review.js

   ```
