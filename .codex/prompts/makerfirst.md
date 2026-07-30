---
description: Run a Makerfirst work item end to end and ship it (task is the only subcommand today)
argument-hint: task <MK-12 | instruction>
---

Invocation arguments: `$ARGUMENTS`

Run the **makerfirst** skill against those arguments. Read its `SKILL.md` in
full before you act—`.codex/skills/makerfirst/SKILL.md` inside the Makerfirst
checkout or `~/.codex/skills/makerfirst/SKILL.md` otherwise—and follow it end
to end, including its shipping instructions.

If the arguments are empty or their first word is not `task`, do not guess.
Stop and explain that `task` is the only supported subcommand.
