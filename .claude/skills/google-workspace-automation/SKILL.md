---
name: google-workspace-automation
description: Build playbook for automations inside Google Workspace: Apps Script, triggers, Calendar events with one-click links, Gmail parsing and labeling, Sheets as a datastore, lightweight web-app forms, clasp deployment, and scheduled AI steps on existing subscriptions. Load when designing or building anything that lives in Calendar, Gmail, Sheets, Drive or Apps Script.
---

# Google Workspace Automation Playbook

Workspace-native automations usually beat standalone apps for personal tools. They show up in apps the owner already uses and need almost no hosting. Use these defaults unless the Spec says otherwise.

## Default patterns
| Need | Default | Note |
|---|---|---|
| Scheduled job | Apps Script time-driven trigger | Free. Per-run and daily runtime quotas apply; check the current quotas before heavy jobs. |
| One-click input | Apps Script web app (`doGet`/`doPost`) serving an HTML form, linked from a calendar event or email | Execute as the owner, with access limited to the owner's account. |
| Datastore | Google Sheet: one tab per entity, append-only log plus derived tabs | Fine at personal volume. Move to a database only if the architect shows a need. |
| Notifications | Gmail to the owner, one label per project | Email to others follows protocol section 5. |
| Calendar output | A dedicated calendar per project | Easy cleanup and health checks. |
| Files | One Drive folder per project | |
| AI step | A scheduled task on the owner's existing plan | No paid AI API calls by default. |
| More than Apps Script can do | The owner's existing web host | |

## Build practices
- **Source control.** Develop locally with `clasp` and keep the code in git. `clasp login` is an owner-must-do step: one Action Packet item.
- **Config.** Keep IDs and settings in `PropertiesService.getScriptProperties()`. Never hardcode or commit secrets.
- **Idempotency.** Triggers can double-fire. Tag created events and rows with a run key and check for it before creating.
- **Run log.** Append a row to a `_runs` tab on every run (timestamp, job, status, counts, error). The ops-steward reads this.
- **Failure mail.** Email the owner at most once per failure type per day.
- **Scopes.** Request the narrowest OAuth scopes in `appsscript.json`.
- **Email processing.** Search by label or subject, and apply a `Processed` label instead of deleting.
- **Time zone.** Set `timeZone` explicitly in `appsscript.json`.
- **Lean code.** Plain functions and no frameworks. Keep each `.gs` file small and focused.

## Testing
- Keep pure logic in plain functions and unit-test it locally.
- Provide a `testRun()` entry point that runs the whole flow against a **test calendar and test sheet**.
- QA verifies observable outcomes: the event exists, the row was written, the email arrived.

## For the ops-steward at delivery
- **Health checks:** e.g. "`_runs` has a success row in the last 26 hours".
- **Usage signal:** e.g. "form submissions in the log tab".
- **Known failures:** expired authorization, quota exceeded, trigger deleted, sheet renamed.
- **Runbook:** re-authorize, then `setupTriggers()`, then `clasp push && clasp deploy`.

## Owner-must-do (minimize and batch)
- One-time `clasp login`, and enabling the Apps Script API.
- First OAuth consent when scopes change.
- Third-party credentials, entered through a pre-built setup form into Script Properties. Never through chat.
