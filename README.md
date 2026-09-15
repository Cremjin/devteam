# devteam

A lean, principles-driven AI software development team for Claude Code: plain agents and skills in `.claude/`.

**How it works.** By default it runs like a rapid-prototyping shop: a short interview, a 1-page spec, a working slice built fast with as little code as possible, one QA pass, delivery, then a check-in after you've used it. R&D mode adds a time-boxed experiment and an architecture note when feasibility is genuinely uncertain.

## Setup
1. Copy `owner.example.md` to `~/.claude/owner.md` and fill it in. It holds your personal details and stays out of this repo.
2. Install locally:
   ```bash
   bash install.sh ~
   ```
3. Install into a project, which cloud sessions need. **Private repos only**, because the owner profile gets copied in:
   ```bash
   bash install.sh /path/to/project ~/.claude/owner.md
   cd /path/to/project && git add .claude .gitignore && git commit -m "chore: install devteam" && git push
   ```
4. Start a new session.

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
| `qa-tester` | sonnet | One test pass per slice, plus a security check |
| `data-seneschal` | sonnet | Project setup, ticket triage, retrospectives that cut process |
| `data-architect` | opus | R&D mode: 1-page architecture and cost |
| `scout` | sonnet | Checks whether something already solves it |
| `ops-steward` | sonnet | Email reply loop, idea pickup, health checks |

## Changing the team
Edit here, never in a project's installed copy. The protocol is capped at 1,500 words and each file at 700; additions must remove as many words as they add. New rules come in as PRs. Never commit personal details.
