---
name: molequle
description: Observe or control the locally running Molequle generative art simulation using its existing MCP tools.
---

Use the Molequle MCP tools when the user asks about their local simulation.
The default API is http://localhost:3333. The plugin is a local desktop stdio
bridge, and requires the Molequle server and browser simulation to be running.

Start observations with molequle_get_state using detail="summary". Use config,
events, metrics, spatial history, trends, and weather logs as the task requires.
Prefer bounded results and correlate observations by tick. If there is no data,
explain that the user needs to open the Molequle browser simulation. If connection
fails, report the unavailable server rather than inventing simulation values.

For requested parameter changes, read the current config first and use
molequle_set_params with a JSON string. Follow the existing tool's documented
parameter names and ranges. Do not assume the bridge enforces numeric ranges.
Apply the changes the user requested; do not change parameters merely to observe.

Use molequle_control for pause, resume, reset, new_run, smoother_on, and
smoother_off. A seed is supported for new_run. Parameter changes and commands
are queued for the browser's next poll (approximately two seconds); distinguish
queued from applied and verify using fresh state/config when possible. Reset
and new_run replace the current run, so use them only when requested or authorized.

molequle_list_saves lists existing automatic saves. The existing bridge has no
manual save, restore, or delete tool: do not claim those actions are available.
Keep all interaction through the existing MCP implementation. Do not rewrite
the simulation, start another simulation server, or expose localhost publicly.
