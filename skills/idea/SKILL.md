---
name: idea
description: Capture a project idea into the owner's Project Portfolio in seconds and have the scout screen it against the owner's principles. Use for "/idea ...", "I have an idea", "add this to the portfolio", or "screen these ideas". With no argument, screens every Portfolio row in Stage "Idea".
---

# Idea Intake

1. **Capture.** If an idea was given, add a Project Portfolio row (data source in the owner profile) with:
   - Name (short)
   - Idea (the owner's words, verbatim)
   - Stage `Idea`
   - Type (`Existing codebase` if a repo is named, with the Repo Path)
   - Submitted: today

   No follow-up questions.
2. **Screen.** Start `scout` on the new row, or on all rows in Stage `Idea` if no idea was given.
3. **Confirm.** Start `product-owner` with the scout's findings to confirm or override the verdict against the owner's principles.
4. **Report.** For each idea, give 3 to 5 lines: verdict, the best existing solution found, the reshaped idea if any, and a suggested priority. Email it if the owner isn't in the session.
5. **Next step.** For a `Build` or `Reshape` the owner wants, offer to start `/devteam` in the right folder.
