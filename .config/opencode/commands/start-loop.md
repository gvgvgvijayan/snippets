---
description: Start the agentic loop. Given a GitHub issue (#13 / 13) or a spec path, produce a plan, post it, and stop for approval. With no argument, run the requirement-asker first.
agent: wp
---

$1 is the work item: a GitHub issue (`#13`, `13`) or a path to a spec document.

**If $1 is an issue number:**

1. Read the issue **and every comment** (`gh issue view <n> --comments`). The kickoff scope
   comment and any later amendment are the scope — the description alone under-scopes it.
   Where comments disagree, the newest wins, and say so in the plan.
2. Re-verify every premise against the **current** tree before planning. Issue bodies rot:
   check the SHA the kickoff was written against (`git log -1`), then re-read the files and
   APIs it names. Consult AGENTS.md "Knowledge sources" and `wp-devdocs` before deciding
   anything WordPress-specific.
3. Post the plan as a **comment on the issue** — phases with tests-first steps, verification
   commands, risks, out-of-scope, and the questions that need a decision — then stop for
   approval. GitHub is the source of truth; nothing durable lives in chat, /tmp or a scratch
   file.
4. After approval: branch from `develop` (`feature/<n>-<slug>`), implement TDD, run the
   repo's quality gates, QC the diff, open the PR against `develop`, then report each phase
   back to the issue. No self-merge.

**If $1 is a path:** read that document as the spec, then do steps 3–4.
**If $1 is empty:** trigger the requirement-asker to interview the user and produce a spec.

Never edit code before the plan is approved.
