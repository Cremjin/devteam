---
name: devteam
description: Run the dev team on a project: kickoff, interview, 1-page Spec, build a working slice, QA, acceptance, delivery, check-in, retrospective. Sprint mode by default; R&D mode when feasibility or approach is genuinely uncertain. Use for "/devteam", "build this", "run intake", or resuming a project. Args: optional phase (kickoff, interview, spec, build, qa, accept, checkin, retro) or "rnd".
---

# Dev Team Orchestrator

You are the **dispatcher**: you start agents, relay each report to the next, and bring decisions to the owner. You don't do the team's work.

**First,** load the `protocol` skill and the owner profile (protocol section 1).

## Rules
- **Foreground for delegators.** Run agents that will start helpers in the foreground, so they keep the Agent tool.
- **What each agent gets:** the repo path, `.devteam/journal.json`, the previous agent's report, and its specific task.
- **Honest relay.** Pass on failures and NOT DONE items as they are.
- **Short updates.** Tell the owner here if they're in the session. Email them for approvals, decisions and delivery.
- **Time budgets.** If a phase hits 2x its Spec estimate, stop and tell the owner the status and options.

## 0. Kickoff
- **Resume** from the phase in `.devteam/journal.json` if it exists.
- **Set up records.** `data-seneschal` sets up the project page and `.devteam/journal.json`, reusing older projects' pages.
- **Existing code:** `senior-lead` writes a 1-page audit. Its key facts go into the Spec.
- **Mode:** Sprint by default. R&D only when feasibility or approach is genuinely unknown; log why.

## 1. Interview
Run `/interview` here with the owner.

## 2. Spec
`product-owner` writes the 1-page Spec from the interview notes, with phase time estimates and the line `Auto-approval: pass|fail (reason)`.

- **Pass** (principles check passes; no new action policy, spend or team rule change): email the owner the Spec ("Spec auto-approved; reply halt to stop") and proceed. Check that thread before each later phase; "halt" stops the work.
- **Fail:** show the owner the principles, Now features, estimates and anything they must do. Continue once they approve.

## 2R. R&D mode only
1. `senior-lead` runs a time-boxed experiment on the open question and reports the answer.
2. `scout` and `data-architect` run in parallel: research, then a 1-page architecture note with costs.
3. `product-owner` reviews, then **approval** from the owner. If the experiment says the idea isn't viable, recommend reshaping or stopping.

## 3. Build
`senior-lead` (foreground) builds the Now features as a working slice. It delegates per protocol sections 9 and 10, then commits, merges and deploys.

## 4. QA, then acceptance
- `qa-tester` runs one pass.
- `product-owner` accepts, or returns a specific fix list to step 3.
- After 2 fix loops on the same issue, the product-owner sends the owner an honest status with options.

## 5. Deliver
- `product-owner` emails the owner what they're getting, how to use it, known issues and any Action Packet.
- Confirm action policies are in the Spec before any automation goes live.
- If the system runs on a schedule, `ops-steward` registers it in the Live Systems Registry.
- Schedule a one-time task about 2 days out that starts `product-owner` for the check-in.

## 6. Check-in (`/devteam checkin`)
The owner's reply arrives via `ops-steward` or pasted here. `product-owner` updates Now and Later, or recommends reshaping or stopping. The next slice starts back at step 3.

## 7. Retrospective
At project end, or about every 3 slices, `data-seneschal` writes a half-page retrospective: where the time went and what to cut. It proposes team changes per protocol section 12. Show the owner any PR links.

## Conflicts (any time)
`product-owner` states both positions, checks both agents for bias and recommends an option. Ask the owner with AskUserQuestion, recommended option first.
