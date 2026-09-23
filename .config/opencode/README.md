# opencode global config

The live opencode global configuration, mirrored from `~/.config/opencode/`.

Migrated to **opencode V2** (2026-09-23). See the commit for the V1 → V2
config-conversion details.

## Contents

- `opencode.json` — MCP servers (`mcp.servers`), `default_agent: plan`
- `cli.json` — CLI/TUI settings (V2); alerts, tabs, session, theme
- `agents/` — the WordPress agentic loop ecosystem (44 agents, V2 frontmatter)
- `commands/` — loop trigger commands

Not committed (see `.gitignore`):

- `service.json` — V2 background-service credential, machine-specific
- `sounds/` — generated attention sounds (regenerate per below)

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

Permissions model (V2): rules are ordered `{action, resource, effect}` objects,
last-match-wins. Plan/review agents `edit: deny`; implement agents `edit: allow`;
`bash` → `shell`. Delegation is parent-only (subagent → `wp` → subagent);
`subagent_depth` stays at the opencode default.

## Commands

- `/start-loop` — trigger the loop from a spec (or run the requirement-asker first)
- `/address-review` — feed GitHub review comments back to the fix agent

## Attention sounds (V2 alerts)

`cli.json` maps each attention event to a WAV under `sounds/` (gitignored).
opencode's bundled miniaudio decodes **WAV/MP3/AAC**, but **not Ogg Vorbis** — a
`.oga` override fails to decode and silently falls back to the built-in sound, so
the freedesktop `.oga` files are converted to WAV first:

```bash
mkdir -p ~/.config/opencode/sounds
for pair in done:complete question:message permission:dialog-warning \
            error:dialog-error subagent_done:message-new-instant default:complete; do
  ffmpeg -v error -y -i /usr/share/sounds/freedesktop/stereo/${pair##*:}.oga \
    -ac 2 -ar 48000 -sample_fmt s16 ~/.config/opencode/sounds/${pair%%:*}.wav
done
```

## Sync workflow

To update the live config from this repo:

```bash
cp -r .config/opencode/agents/* ~/.config/opencode/agents/
cp -r .config/opencode/commands/* ~/.config/opencode/commands/
cp .config/opencode/opencode.json .config/opencode/cli.json ~/.config/opencode/
```

To update this repo from the live config: copy the files back and open a PR.
The V1 config files (`opencode.jsonc`, `tui.jsonc`, `opencode-notifier.json`)
were removed after the V2 migration — recover them from git history if needed.

## Re-sync from the manual

The agent files originate from `wp-agentic-loop-implementation-manual` `opencode/`.
When the manual changes, re-copy the affected `opencode/agent/*.md` files here and
open a PR.
