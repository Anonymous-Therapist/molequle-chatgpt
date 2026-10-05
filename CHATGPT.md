# ChatGPT setup

This is a desktop-only local plugin. It gives a ChatGPT Work or Codex chat ten
Molequle MCP tools while the Molequle server and browser simulation run on the
same computer.

```powershell
# Prepare the Python bridge from the cloned marketplace repository
powershell -NoProfile -ExecutionPolicy Bypass -File .\plugins\molequle-local\setup.ps1

# Register and install the plugin
codex plugin marketplace add https://github.com/anonymous-therapist/molequle-chatgpt
codex plugin add molequle-local@molequle-chatgpt
```

Restart ChatGPT Desktop and begin a new Work or Codex chat. Type
`@Molequle Local`, then ask for the current simulation state.

The simulation must be visible at <http://localhost:3333>. Keep only one
Molequle page open so another tab does not consume queued control commands.
