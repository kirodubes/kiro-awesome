<p align="center">
  <img src="kiro.jpg" alt="Kiro" width="220" />
</p>

# edu-awesome

Educational / tutorial repository for [awesome WM](https://awesomewm.org/), a highly configurable Lua-driven dynamic window manager. Part of the `~/EDU/` learning series — a working awesome config dropped on top of a fresh Arch / Kiro install.

## What's in this repo

- `etc/skel/` — user-facing configs that land in `/etc/skel/` and propagate to new users (or can be copied into an existing `$HOME`).
- `setup.sh`, `up.sh`, `cleanup.sh` — standard EDU bash scaffold.

## Keybindings

Press **`Super + S`** to open awesome's built-in hotkey popup — an on-screen list of every shortcut. The full list also ships as a plain-text [`keybindings.txt`](etc/skel/.config/awesome/keybindings.txt) in the config directory.

## Installation

### From `nemesis_repo` (recommended)

```ini
[nemesis_repo]
SigLevel = Never
Server = https://erikdubois.github.io/$repo/$arch
```

```bash
sudo pacman -Syu
sudo pacman -S edu-awesome
```

You'll also need awesome itself:

```bash
sudo pacman -S awesome
```

### Manual

```bash
git clone https://github.com/erikdubois/edu-awesome.git
cd edu-awesome
sudo cp -r etc/skel/. /etc/skel/
```

Existing users can copy the config into their own home:

```bash
cp -rT /etc/skel ~/
```

## Websites

Information : https://erikdubois.be

## Social Media

Youtube : https://www.youtube.com/erikdubois

<!-- KIRO-FUNDING-FOOTER:START — managed by Kiro-HQ/cascade-readme-footer.sh -->
## Help fund Kiro

Everything I build here stays free and open — always. If Kiro or any of these
tools have ever saved you time or taught you something, a small monthly
contribution helps keep the work going. Donations target break-even, nothing
more — the core always stays free for everyone.

- GitHub Sponsors: https://github.com/sponsors/erikdubois
- Patreon: https://www.patreon.com/c/kiroproject
- YouTube memberships: https://www.youtube.com/@ErikDubois/join
- Ko-fi: https://ko-fi.com/erikdubois
- PayPal: https://www.paypal.me/erikdubois
<!-- KIRO-FUNDING-FOOTER:END -->

## License

See [LICENSE](./LICENSE).
