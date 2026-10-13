# Homebrew tap

## Brink

[Brink](https://brinknotch.site) is a quiet notch on the edge of your Mac's screen that keeps your Notion pages and tasks one hover away.

```bash
brew install --cask stepanblaha/tap/brink
```

Update with `brew upgrade --cask brink`. Uninstall with `brew uninstall --cask brink`, or add `--zap` to also remove Brink's settings and cache. Your Notion token stays in the Keychain until you remove it in Brink Settings.

Brink is not notarized yet, so the first time, right-click Brink in Applications and choose **Open**.

Brink is an independent app and is not affiliated with, endorsed by, or sponsored by Notion Labs, Inc.

## pier

[pier](https://github.com/StepanBlaha/pier) shows what's running on localhost and which project it belongs to: a menu bar app and CLI to find, open, restart and stop your local dev servers.

```bash
brew install stepanblaha/tap/pier
pier app install   # optional: the menu bar app
```

pier is built from source on install, so macOS never shows a Gatekeeper prompt. Update with `brew upgrade pier`.

