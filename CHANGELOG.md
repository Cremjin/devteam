# Changelog

- Initial public release: lean Sprint/R&D working method, 1-page spec, decision log, blocker-only tickets, engineering rules, word caps on team instructions, owner profile kept out of the repo.
- Notion writes are pre-approved: agents write to any Notion page, the owner's own included, without asking. Email, Calendar, Sheets and Drive still need an action policy.
- Packaged as a Claude Code plugin and marketplace: `agents/` and `skills/` moved to the repo root with a `.claude-plugin/` manifest. Enabling it on claude.ai or installing it from the marketplace loads the team in every repo, so cloud sessions no longer need a per-repo install. `install.sh` still pins a copy into one project.
