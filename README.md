# devteam

A lean, principles-driven AI software development team for Claude Code: plain agents and skills, packaged as a plugin.

**How it works.** By default it runs like a rapid-prototyping shop: a short interview, a 1-page spec, a working slice built fast with as little code as possible, one QA pass, delivery, then a check-in after you've used it. R&D mode adds a time-boxed experiment and an architecture note when feasibility is genuinely uncertain.

## Setup
Everything personal lives in the owner profile, which never enters this repo. Copy `owner.example.md` to `~/.claude/owner.md` and fill it in first.

### As a plugin (recommended)
The repo is its own plugin and marketplace, so the team loads in every repo without being copied into any of them:

```bash
claude plugin marketplace add cremjin/devteam
claude plugin install devteam@devteam
```

Enabling `devteam` on claude.ai does the same thing for your account, and syncs it into cloud sessions and Cowork as well.

Start a new session. Skills are namespaced: `/devteam:devteam`, `/devteam:idea`. Agents are `devteam:senior-lead` and so on.

Cloud sessions don't carry your machine's `~/.claude`, so write the owner profile in from the **Setup script** on your cloud environment, with `DEVTEAM_OWNER` set as an environment variable there:

```bash
mkdir -p ~/.claude && printf '%s' "$DEVTEAM_OWNER" > ~/.claude/owner.md
```

### Into one project
Pins a copy of the team to one repo. **Private repos only**, because the owner profile gets copied in:

```bash
bash install.sh /path/to/project ~/.claude/owner.md
cd /path/to/project && git add .claude .gitignore && git commit -m "chore: install devteam" && git push
```

Skills and agents then keep their bare names (`/devteam`, `senior-lead`), and a project copy overrides the plugin's same-named agent. Run `bash install.sh ~` to do the same for local sessions only.

## Use
| Command | What it does |
|---|---|
| `/devteam:devteam` | Run the team on the current project (`rnd` argument for R&D mode) |
| `/devteam:interview` | Project principles and features interview |
| `/devteam:principles` | Your standard principles interview |
| `/devteam:idea <idea>` | Add an idea to the portfolio and screen it |

Drop the `devteam:` prefix when the team is installed into a project instead of loaded as a plugin.

## Team
| Agent | Model | Role |
|---|---|---|
| `product-owner` | opus | 1-page spec, acceptance, check-in, conflicts; your advocate |
| `senior-lead` | opus | Builds with the least code, delegates by model, deploys |
| `qa-tester` | sonnet | One test pass per slice, plus a security check |
| `data-seneschal` | sonnet | Project setup, ticket triage, retrospectives that cut process |
| `data-architect` | opus | R&D mode: 1-page architecture and cost |
| `scout` | sonnet | Checks whether something already solves it |
| `ops-steward` | sonnet | Email reply loop, idea pickup, health checks |

## Changing the team
Edit here, never in an installed copy. To try changes before pushing, run Claude from this repo with `claude --plugin-dir .`. The protocol is capped at 1,500 words and each file at 700; additions must remove as many words as they add. New rules come in as PRs. Never commit personal details.
