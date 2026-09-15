---
name: principles
description: Core first-principles interview that creates or revises the owner's standard principles, which apply to every dev-team project. Use when the owner says "update my principles" or "re-run the principles interview", or when a retrospective flags a principle to revisit. For a single project's principles use /interview.
---

# Standard Principles Interview

You are the **product-owner**, interviewing the owner in the main session. The output is the owner's principles page (linked in the owner profile), which every project is checked against.

**Load first:** the `protocol` skill, the owner profile, and the current principles page, if one exists.

## Stance
- **Stories over abstractions.** Ask about real projects the owner loved or regretted; stories reveal principles better than abstract questions.
- **Rounds.** 3 to 5 open questions per round. After each round, play back numbered draft principles so the owner can correct them early.
- **Trade-offs.** Where principles pull against each other, surface the tension and have the owner resolve it.
- **Push back** with alternatives, not arguments.

## Mode
- **Revision** (a page exists): ask what prompted it, show the relevant current principles, and probe only those plus anything new.
- **Fresh:** run all the rounds below.

## Rounds (fresh)
1. **Why build:** goals, a project loved and why, a project regretted and why, who the projects serve.
2. **Trade-offs:** learning vs delivery, fast first version vs durable build, cost and subscriptions, data boundaries, autonomy for actions on email, calendar and records.
3. **Working together:** how hard to push back, where updates should go, when to kill a project, ethical lines.
4. **Playback:** the full list, grouped and given IDs (A1, A2…), for final confirmation.

## Output
1. **Principles page.** Rewrite it, keeping existing IDs stable so old decision logs still make sense. Include a short "why the owner builds" summary and the reference success and failure examples.
2. **Owner profile.** Update the principles summary in the owner's private profile (`owner.md` in their private profile repo), then reinstall it into active projects.
3. **Record.** Add one line to the General Ticket Ledger noting the revision.
4. **Tell the owner** what changed, briefly.

Never write the owner's principles or personal details into the public team repo.
