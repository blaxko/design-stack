# Flow pattern library

Convergent patterns for common product journeys — what most well-run products do, the order they do it in, and the failure states that must be designed. Use each as a starting skeleton and a completeness check. "Must handle" items are the ones teams most often forget.

## Contents
Accounts: Sign up · Log in · Passwordless / magic link · Forgot password · Email / phone verification · Two-factor setup · Delete account
Activation: Onboarding (B2B SaaS) · Onboarding (consumer mobile) · Permission requests · Invite teammates · Empty state → first value
Commerce: Add to cart → checkout · Add payment method · Upgrade / paywall · Cancel subscription · Promo code · Refund / order issue
Content & data: Search & filter · Upload media · Create / edit / save · Bulk actions · Import data · Export / share
Settings & support: Change email / password · Notification preferences · Contact support · Feedback / rating prompt
Fintech & web3: KYC / identity verification · Connect wallet · Sign / confirm a transaction · Deposit / on-ramp · Withdraw · Swap / trade · Send to address
Lifecycle email: Welcome series · Trial ending · Payment failed (dunning) · Win-back

---

## Accounts

### Sign up
Typical sequence: entry CTA → social/SSO buttons + email field → password (or magic link) → verify email (can be deferred) → light profile → onboarding.
- Offer SSO (Google/Apple; Microsoft for B2B) above the email form; Apple is required on iOS if any other social login is offered.
- Collect only email + password up front; defer name, company, role to onboarding.
- Password rules shown live before failure; show/hide toggle.
- Link to log in for people who already have an account; terms consent as text under the button, not a pre-ticked box.
- **Must handle:** email already registered (offer log in / reset, don't leak existence on sensitive products), weak password, SSO cancelled, verification email not arriving (resend with cooldown, change email), disposable-email/bot protection without a hostile CAPTCHA.

### Log in
Sequence: identifier → password (same screen or identifier-first) → 2FA if enabled → land where they were going (preserve the deep link).
- Password manager friendly: proper `autocomplete` attributes, no paste blocking.
- "Forgot password" next to the password field; "Sign up" link below.
- **Must handle:** wrong credentials (generic message), locked account (when & how to unlock), SSO-only accounts trying a password, expired session mid-task (re-auth without losing work), "remember this device".

### Passwordless / magic link / OTP
Sequence: email or phone → "check your inbox" screen naming the address → link/code → signed in.
- Code input: auto-advance, paste whole code, auto-submit on last digit, SMS autofill on mobile.
- Show the destination, a resend timer, and "use a different email".
- **Must handle:** link opened on a different device/browser, expired or used link, typo'd address.

### Forgot password
Sequence: email → neutral confirmation ("if an account exists…") → email link → new password (+ confirm or show toggle) → signed in or back to log in with success message.
- **Must handle:** expired link, link reused, new password equals old, sign out other sessions option.

### Email / phone verification
- Let people keep using the product with a persistent banner where possible; gate only what genuinely needs verification.
- Resend with countdown; edit the address; deep link from email straight back into the flow.

### Two-factor setup
Sequence: choose method (authenticator app preferred, passkey, SMS fallback) → QR + manual key → enter code to confirm → backup codes (download/copy, require acknowledgement) → done.
- **Must handle:** clock-skewed codes, lost device recovery path, disabling 2FA requires re-auth.

### Delete account
Sequence: settings → danger zone → explain consequences (data, subscriptions, team ownership) → offer alternatives (export, pause, downgrade) → re-auth → type-to-confirm → confirmation + email.
- **Must handle:** active subscription, sole owner of a workspace, grace period / undo window.

## Activation

### Onboarding — B2B SaaS
Sequence: welcome → 1–3 questions (role, team size, use case) that actually change the setup → create first workspace/project → invite teammates (skippable) → guided first task → checklist that persists.
- Every question must visibly personalise something; otherwise cut it.
- Templates/sample data beat blank canvases.
- Progress indicator; skip and resume later.
- **Must handle:** joining an existing workspace via invite (skip creation), domain-based auto-join, user who skips everything.

### Onboarding — consumer mobile
Sequence: 2–4 value screens at most (or none — go straight to the product) → account (or browse as guest) → personalisation picks → permission primers → home with first content.
- Delay sign-up until the user has felt value when the product allows it.
- **Must handle:** permissions denied, returning user reinstalling, small screens.

### Permission requests (notifications, location, camera, contacts)
- Ask in context, at the moment of need, after a pre-prompt explaining the benefit — never all at launch.
- **Must handle:** denied → graceful degradation + path to system settings; "only while using"; approximate location.

### Invite teammates
Sequence: invite entry point → emails (paste many) or shareable link → role picker → send → pending list with resend/revoke.
- **Must handle:** already a member, outside allowed domain, seat limit / billing impact shown before sending, invite accepted by someone without an account (lands in sign-up pre-filled).

### Empty state → first value
- Each empty screen explains what will appear, why it's useful, and offers one primary action (create, import, connect) — plus sample data where possible.

## Commerce

### Add to cart → checkout
Sequence: product → add to cart (non-blocking confirmation, mini-cart) → cart (edit qty, remove, totals, promo) → checkout: contact → shipping → delivery method → payment → review → place order → confirmation page + email.
- Guest checkout; address autocomplete; totals including tax and shipping visible before the payment step.
- Wallets (Apple Pay / Google Pay) as express options at cart.
- **Must handle:** out of stock mid-checkout, price change, payment declined (keep form, say why), 3-D Secure challenge, double-submit prevention, back button from payment.

### Add payment method
- Card field with brand detection, formatting, inline validation; save as default toggle.
- **Must handle:** declined card, SCA/3DS, expired card replacement, removing the last method on an active plan.

### Upgrade / paywall
Sequence: hit a limit or tap upgrade → plan comparison (current plan marked, monthly/annual toggle) → checkout → immediate unlock + confirmation.
- Show what they'll get *for the thing they were trying to do*; prorations stated plainly.
- **Must handle:** trial users, team admin vs member (member requests upgrade from admin), downgrade path.

### Cancel subscription
Sequence: settings → billing → cancel → reason (optional, one tap) → one relevant save offer (pause, discount, downgrade) → clear summary of what happens and when access ends → confirm → confirmation + email.
- Must be findable and completable without contacting support; no guilt-trip copy; never more than one retention step.
- **Must handle:** annual plans/refunds, reactivation before period end.

### Promo code
- Collapsed "Have a code?" link near totals; apply inline; show discount line; clear errors (expired, not applicable to item, minimum not met).

### Refund / order issue
- Order list → order → "problem with this order" → item + reason → resolution choice (refund, replace) → confirmation and timeline.

## Content & data

### Search & filter
- Search visible where expected; recent and suggested queries; results as you type for small datasets.
- Filters show counts, applied filters as removable chips, "clear all", and are reflected in the URL.
- **Must handle:** no results (suggest spelling fixes, broaden filters), slow results (skeletons), typos.

### Upload media
Sequence: picker or drag-and-drop → client-side checks (type, size) → progress per file → processing state → preview → confirm/attach.
- **Must handle:** unsupported type, too large, network drop (retry/resume), cancel mid-upload, duplicate files, mobile camera vs library.

### Create / edit / save
- Autosave with visible status, or explicit save with unsaved-changes guard on navigation.
- **Must handle:** validation errors on save, conflicting edit by another user, offline, discard changes confirmation.

### Bulk actions
- Select (row, all on page, all matching) → contextual action bar with count → confirm for destructive actions → undo toast.

### Import data
Sequence: choose source (file, integration) → upload → map columns (auto-match, preview) → validate (row-level errors, download error report) → import → summary.

### Export / share
- Format and scope choice; async export with notification for large sets; share links with permission level and expiry.

## Settings & support

### Change email / password
- Re-auth first; verify new email before switching; notify the old address; sign out other sessions option.

### Notification preferences
- Grouped by topic with channel columns (email, push, in-app); sensible defaults; one-click unsubscribe from emails lands here.

### Contact support
- Help search first (with deflection suggestions as they type) → contact form pre-filled with account/context → expected response time → confirmation + ticket reference.

### Feedback / rating prompt
- Trigger after a success moment, never mid-task; one-tap sentiment first, detail optional; don't ask again soon after a dismissal.

## Fintech & web3

### KYC / identity verification
Sequence: explain why and how long (and what documents) → personal details → document capture (front/back with auto-capture and glare/blur detection) → selfie/liveness → review → pending state with expected time → approved / needs-more-info.
- Save progress; allow switching to mobile via QR for camera capture.
- **Must handle:** rejected document with specific reason, unsupported country, name mismatch, manual review delays (status page + notification).

### Connect wallet
Sequence: "Connect" CTA → wallet picker (detected/installed wallets first, WalletConnect/QR, "I don't have a wallet" help) → wallet approval → wrong-network check (one-click switch) → optional sign-in signature (explain it's free and gasless) → connected state showing truncated address, network, balance, disconnect.
- **Must handle:** wallet not installed, user rejects connection, wrong chain, account switched in wallet mid-session, mobile deep-link round trips, session restore on reload.

### Sign / confirm a transaction
Sequence: review screen in-app (what will happen in plain language, amounts in token and fiat, fees/gas estimate, slippage, recipient/contract) → "Confirm in wallet" waiting state → submitted (hash link to explorer) → pending with progress → confirmed / failed.
- Never rely on the wallet popup alone to explain the action.
- **Must handle:** user rejects in wallet (return to review, no error drama), insufficient gas token, gas spike, transaction stuck/dropped (speed up/cancel guidance), revert with a human-readable reason, approvals (token allowance) as a separate clearly explained step, page closed while pending (resume from history).

### Deposit / on-ramp
- Choose asset and network (warn loudly about network mismatch) → show address + QR + memo/tag if required → copy with confirmation → pending deposit tracker with confirmations count.
- Fiat on-ramp: amount → quote with fees and rate expiry → provider handoff/KYC → status.

### Withdraw / send to address
- Address field with validation, checksum, address-book, ENS/name resolution; network selector; amount with "max" (minus fees); fee shown; review screen; 2FA/confirmation; status with hash.
- **Must handle:** invalid/contract address warnings, first-time-address warnings, minimum withdrawal, daily limits.

### Swap / trade
- From/to selectors with balances, flip button, live quote with route, price impact and slippage settings, rate refresh countdown, review → wallet confirm → status.
- **Must handle:** quote expired, insufficient liquidity, high price impact warning, approval needed first.

## Lifecycle email (Page Flows also catalogues these)

- **Welcome series:** immediate welcome with one next step → day 1–3 nudges toward the activation action → social proof/tips. Stop when the action is done.
- **Trial ending:** reminders a few days and one day before, showing what they used and what they'd lose; one-click upgrade.
- **Payment failed (dunning):** immediate notice with update-card link → reminders → final notice before downgrade; never lock data without warning.
- **Win-back:** what's new since they left, one compelling reason, easy return path.
