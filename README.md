# devteam

A lean, principles-driven AI software development team for Claude Code, packaged as a plugin.

**How it works.** Like a rapid-prototyping shop: a short interview, a 1-page spec, a working slice built with as little code as possible, one QA pass, delivery, then a check-in after use. R&D mode adds an experiment and an architecture note when feasibility is uncertain.

## Setup
1. In Notion, create a page titled exactly **Owner Profile** under Dev Team HQ, from `owner.example.md`. Connect Notion under claude.ai **Customize > Connectors**.
2. **Cloud (claude.ai/code):** `/plugin` doesn't exist there. Edit your cloud environment (environment menu in the session title bar > Edit) and add to **Setup script**:
   ```bash
   claude plugin marketplace add cremjin/devteam && claude plugin install devteam@devteam || true
   ```
   Every repo using that environment gets the team. Updates arrive when the environment cache rebuilds (script edit, or about weekly).
3. **Local CLI:** `/plugin marketplace add cremjin/devteam`, then `/plugin install devteam@devteam`. Desktop app: **+ > Plugins > Add plugin**.
4. In any repo, run `/devteam`.

Notion reads and writes run without prompts; delete, move and duplicate still ask.

## Use
| Command | What it does |
|---|---|
| `/devteam` | Run the team on the current project (`/devteam rnd` for R&D mode) |
| `/interview` | Project principles and features interview |
| `/principles` | Your standard principles interview |
| `/idea <idea>` | Add an idea to the portfolio and screen it |

## Team
| Agent | Model | Role |
|---|---|---|
| `product-owner` | opus | 1-page spec, acceptance, check-in, conflicts; your advocate |
| `senior-lead` | opus | Builds with the least code, delegates by model, deploys |
| `qa-tester` | sonnet | One test pass per slice, plus security |
| `reviewer` | opus | Independent, read-only review of test pre-registrations and results |
| `data-seneschal` | sonnet | Project setup, ticket triage, retrospectives |
| `data-architect` | opus | R&D mode: 1-page architecture and cost |
| `scout` | sonnet | Checks whether something already solves it |
| `ops-steward` | sonnet | Email reply loop, idea pickup, health checks |

## Changing the team
Edit here, never in an installed copy; list new agents in `.claude-plugin/plugin.json`. Caps: protocol 1,500 words, other files 700; additions remove as many words as they add. New rules come in as PRs. Never commit personal details.
