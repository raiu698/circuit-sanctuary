# Circuit Sanctuary — website + profile assets

**Live: <https://raiu698.github.io/circuit-sanctuary/>**
Repo: <https://github.com/raiu698/circuit-sanctuary>

Any push to `main` republishes the site within a minute or two.

Everything here is self-contained. `index.html` has no external requests at all
(logo is inline SVG, fonts are system fonts), so it loads instantly and works offline.

```
index.html          the whole site, one file
cards/*.png         1200×1200 graphics to post on your Google profile
cards/*.svg         editable sources for those cards
serve.sh            starts the local server
```

## Running it locally

```sh
./serve.sh
```
Then open <http://localhost:8899> in a browser. That's your machine only — nobody
else can reach it.

## Making it public

**A public URL is what Google's "Website" field needs.** `localhost` and LAN
addresses load for nobody but you, so putting one in your profile is worse than
leaving it blank.

### Option 1 — Tailscale Funnel (you already run Tailscale)

In one terminal:
```sh
./serve.sh
```
In another:
```sh
tailscale funnel 8899
```
That prints a real HTTPS address like `https://<machine>.<tailnet>.ts.net`.
No port forwarding, no domain to buy, certificate handled for you.

Two things to know before relying on it:
- **Funnel has to be enabled for your tailnet** in the admin console under
  Access Controls; it's off by default.
- **The site is only up while your computer is on and both commands are running.**
  If the machine sleeps, your business website is down.

To make it survive reboots, run both as systemd user services rather than by hand.

### Putting Cloudflare in front of it

The site is already on GitHub Pages, which is what Cloudflare Pages wants as a
source. In the Cloudflare dashboard: **Workers & Pages → Create → Pages →
Connect to Git → pick `circuit-sanctuary`**. Leave the build command empty and
the output directory as `/`. That gives you a `*.pages.dev` URL and lets you
attach a custom domain later.

### Option 2 — other free static hosts

Cloudflare Pages, Netlify, or GitHub Pages will host this single file free,
keep it up 24/7, and let you point a real domain at it later. Drag `index.html`
onto any of them and you're done in about two minutes.

For a business listing, "always up" matters more than "self-hosted" — a customer
who taps your website link at 11pm and gets nothing is a customer you lost.
The file is yours either way; nothing here locks you to a host.

## Editing the site

Open `index.html` in any text editor. Everything a person normally wants to
change is near the top of `<body>`, in plain text:

- phone number — appears in four places, search for `435-4958`
- hours — the `<table class="hours">` block
- services — the six `<div class="card">` blocks
- towns — the `.areas` block

Colors are CSS variables at the very top of `<style>` (`--green`, `--bg`, etc.),
so changing the palette is a couple of edits.

## Note on your address

The site deliberately **does not** list your street address, matching the
service-area setting on your Google profile. If you ever paste the address in,
it becomes public.
