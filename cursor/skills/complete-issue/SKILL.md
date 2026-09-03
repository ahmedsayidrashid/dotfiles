---
name: complete-issue
description: Fully implement a GitHub issue from issue number to pull request. Use when the user provides a GitHub issue number and wants the issue completed autonomously. Retrieve the issue using GitHub MCP, understand the requirements, inspect the codebase, implement the change, perform a basic sanity check, review the diff, create a branch, commit and push the changes, create a pull request linked to the issue, update the issue, and report completion.
---

---

# Complete Issue

Take a GitHub issue from an issue number to a review-ready pull request.

The user will provide an issue number.

Your workflow is:

**Retrieve → Understand → Implement → Sanity Check → Review → Commit → Push → PR → Notify**

Work autonomously. Do not ask for confirmation for normal development steps.

---

## 1. Retrieve the Issue

Use the configured GitHub MCP to retrieve the issue.

Read:

- Issue title
- Description
- Acceptance criteria
- Labels
- Comments
- Any relevant linked issues or PRs

Treat the issue and its comments as the primary source of requirements.

Do not ask the user to paste the issue contents.

---

## 2. Understand the Existing Code

Before making changes:

- Inspect the repository structure.
- Find the code relevant to the issue.
- Search for existing implementations and patterns.
- Inspect related FastAPI routes/services.
- Inspect relevant Jinja2 templates.
- Inspect relevant database models/migrations.
- Inspect authentication/authorization logic when applicable.

Follow the existing architecture and conventions.

Do not introduce unnecessary dependencies or architectural changes.

---

## 3. Implement the Issue

Implement the issue completely.

Keep the change focused on the issue.

Do not refactor unrelated code.

For the current application, remember that the stack includes:

- FastAPI
- Jinja2
- PostgreSQL
- Supabase Auth

However, inspect the actual repository before making assumptions.

### Backend

Follow existing FastAPI patterns.

Pay attention to:

- Input validation
- Error handling
- Authentication
- Authorization
- Database access
- User ownership

### Frontend

Follow existing Jinja2 templates and styling.

Reuse existing components and patterns where possible.

Do not redesign unrelated UI.

### Database

If database changes are required:

- Follow the existing migration system.
- Preserve existing data.
- Follow existing schema conventions.

If the change would destroy or irreversibly modify existing user data, stop and ask the user before proceeding.

---

## 4. Basic Sanity Check

There are currently no formal test cases for this project.

Do NOT spend time creating a test suite unless the issue explicitly requires it.

Instead, perform reasonable basic verification.

Depending on the issue, this may include:

- Checking for syntax/import errors.
- Running the application if practical.
- Exercising the affected endpoint.
- Checking the affected page.
- Inspecting database queries/migrations.
- Checking that referenced files/functions actually exist.
- Reviewing obvious error paths.

Do not claim that you tested something if you did not.

The absence of formal tests should not prevent you from doing basic engineering sanity checks.

---

## 5. Review Your Changes

Before committing, inspect the complete diff.

Run:

```bash
git status
git diff
```

Check for:

- Unrelated changes
- Debug code
- Accidental deletions
- Hardcoded secrets
- Incorrect imports
- Obvious bugs
- Broken existing behavior
- Poorly scoped changes

Fix problems you discover.

Do not modify unrelated user changes.

---

## 6. Git Branch

Never commit directly to the main/default branch.

Check the current branch and working tree first.

Preserve any unrelated uncommitted work already present in the repository.

Create a branch based on the issue:

```text
feat/<short-description>
```

or:

```text
fix/<short-description>
```

Use the repository's existing naming convention if one exists.

---

## 7. Commit

Commit only the changes belonging to the issue.

Use a concise, descriptive commit message.

Do not commit:

- Secrets
- Credentials
- `.env` files containing secrets
- Debug artifacts
- Unrelated changes

Make sure commit messages start with either `feat:`, `fix:`, `docs:` or something relevant to the change.

---

## 8. Push

Push the issue branch to GitHub.

Verify that the branch was successfully pushed.

---

## 9. Create the Pull Request

Use the configured GitHub MCP to create a pull request.

The PR should:

- Target the repository's default branch.
- Reference the original issue.
- Explain what was implemented.
- Mention any relevant sanity checks performed.
- Mention anything that could not be verified.

Keep the PR description concise.

Do not claim formal tests were run when they were not.

---

## 10. Update the Issue

After creating the PR, add a concise comment to the original GitHub issue amd the PR.

Include:

- What was implemented.
- Any sanity checks performed.
- Link to the PR for the issue.
- Closes reference in the PR for the issue.

Do not close the issue unless the repository's workflow clearly expects automatic closure.

---

## 11. Final Response

After everything is complete, report:

```text
Issue: #<number> — <title>
Status: Ready for review

PR: <PR URL>
Branch: <branch>

Implemented:
- ...

Sanity checks:
- ...

Notes:
- ...
```

Keep the response concise.

---

# Autonomous Behavior

Do not ask for confirmation before:

- Reading the issue
- Inspecting the repository
- Creating a branch
- Editing files
- Running basic sanity checks
- Committing
- Pushing
- Creating the PR
- Updating the issue

Ask the user only when human judgment is genuinely required.

Examples:

- The issue is materially ambiguous.
- A destructive database change is required.
- The requested behavior conflicts with existing product behavior.
- You cannot safely determine the intended implementation.

Otherwise, make a reasonable engineering decision and continue.

---

# Core Principle

Act like an engineer completing a ticket, not an assistant waiting for instructions at every step.

**The goal is a clean implementation and a review-ready PR.**
