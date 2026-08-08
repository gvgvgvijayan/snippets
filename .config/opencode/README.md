# opencode global config

The live opencode global configuration, mirrored from `~/.config/opencode/`.

## Contents

- `opencode.json` — MCP servers, `default_agent: plan`
- `opencode.jsonc` — server config
- `tui.jsonc` — TUI config
- `agents/` — the WordPress agentic loop ecosystem (44 agents)
- `commands/` — loop trigger commands

## Agent ecosystem

Implements the WordPress Agentic Loop
([wp-agentic-loop-implementation-manual](https://github.com/gvgvgvijayan/wp-agentic-loop-implementation-manual)):

```
spec → plan → build → PR → review → fix → merge
```

- `wp` — primary orchestrator (Tab-switchable). Delegates via the Task tool only.
- 11 pipeline agents: requirement-asker, requirement-generator, wp-lingo-translator,
  task-generator, tracer-bullet, issue-creator, implementor, qc, code-reviewer,
  adr-agent, research-agent
- 32 domain experts: interactivity-api, html-api, block-markup-designer,
  security-agent, rest-api, block-themes, plugin-development, performance, phpstan,
  wpcli-ops, playground, project-triage, abilities-api, query, taxonomy, media, cron,
  multisite, rewrite, http, option, formatting, customize, widgets, feed, shortcode,
  nav-menu, locale, sitemaps, block-bindings, ai-client, hospital-manager

Permissions model: plan/review agents `edit: deny`; implement agents `edit: allow`.
Delegation is parent-only (subagent → `wp` → subagent); `subagent_depth` stays at the
opencode default.

## Commands

- `/start-loop` — trigger the loop from a spec (or run the requirement-asker first)
- `/address-review` — feed GitHub review comments back to the fix agent

## Sync workflow

To update the live config from this repo:

```bash
cp -r .config/opencode/agents/* ~/.config/opencode/agents/
cp -r .config/opencode/commands/* ~/.config/opencode/commands/
```

To update this repo from the live config: copy the files back and open a PR.

## Re-sync from the manual

The agent files originate from `wp-agentic-loop-implementation-manual` `opencode/`.
When the manual changes, re-copy the affected `opencode/agent/*.md` files here and
open a PR.
