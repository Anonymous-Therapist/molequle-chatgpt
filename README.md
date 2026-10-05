# Molequle for ChatGPT

Give ChatGPT Desktop the ability to observe and control a locally running
[Molequle](https://github.com/TheFeloniousMonk/Molequle) simulation.

This repository packages Molequle's existing Python MCP bridge as a private,
desktop-only ChatGPT/Codex plugin. It does not change the simulation. The bridge
connects to Molequle's local REST API at `http://localhost:3333`.

## What ChatGPT can do

- Inspect live state, entities, configuration, and spatial history
- Read events, metrics, long-term trends, and weather history
- Change supported simulation parameters
- Pause, resume, reset, or start a seeded run
- Toggle The Smoother
- List automatic saves

## Install on Windows

You need ChatGPT Desktop, Python 3.10+, Node.js, Git, and the Codex CLI that
ships with ChatGPT Desktop.

### 1. Install and run Molequle

```powershell
git clone https://github.com/TheFeloniousMonk/Molequle.git
cd Molequle/server
npm install
npm start
```

Open <http://localhost:3333> and keep the simulation page open. Molequle runs
inside the browser; the server alone does not advance the simulation.

### 2. Install the MCP dependencies

From this repository:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\plugins\molequle-local\setup.ps1
```

If `python` is not your Python command, pass its path with
`-PythonExecutable`.

### 3. Add the marketplace and plugin

```powershell
codex plugin marketplace add https://github.com/anonymous-therapist/molequle-chatgpt
codex plugin add molequle-local@molequle-chatgpt
```

Restart ChatGPT Desktop, start a new **Work** or **Codex** chat, and invoke
`@Molequle Local`. The local stdio tools were tested in Work and Codex; ordinary
Chat mode may display the plugin mention without loading its local tools.

Try:

- “Show me the current Molequle state and recent events.”
- “Start a new run with seed 8675309.”
- “Compare recent population and bond trends.”
- “Pause Molequle.”

## One tank at a time

Molequle's control queue is single-use. If several Molequle browser tabs are
open, a background tab can consume a command before the tab you are watching.
Keep one simulation page open when controlling it through ChatGPT.

## Architecture

```text
ChatGPT Desktop
  -> local stdio MCP bridge
  -> http://localhost:3333/api/*
  -> Molequle browser simulation
```

## Credits

Molequle and its MCP implementation were created by **Jinx** in
[TheFeloniousMonk/Molequle](https://github.com/TheFeloniousMonk/Molequle).
The MCP bridge in `plugins/molequle-local/server/main.py` is preserved from
upstream commit `67d9d496a6c14f272910111ee070910a857315a5`. The upstream
repository identifies the project as MIT-licensed.

This repository adds only the ChatGPT/Codex plugin packaging, marketplace, and
installation instructions.
