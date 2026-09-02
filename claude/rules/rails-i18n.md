---
paths:
  - "config/locales/*.yml"
---

- Keep all interface texts in the config/locales/*.yml files.
- Use the same key for the same text across different locales, e.g. `en.yml
  en:
    hello: "Hello"
  es:
    hello: "Hola"`
- Use nested keys for better organization, e.g. `en.yml
  en:
    users:
      show: "Show user"
      edit: "Edit user"`
- Use interpolation for dynamic texts, e.g. `en.yml
  en:
    welcome: "Welcome, %{name}!"`
- Use pluralization for texts that depend on a count, e.g. `en.yml
  en:
    notifications:
      one: "You have 1 notification"
      other: "You have %{count} notifications"`
- Use the `translate` method instead of `t` for better readability, e.g. `translate("users.show")` instead of `t("users.show")`.
- Keep the translation files organized and clean, removing any unused keys and values to avoid clutter and confusion.
- Keep translation keys sorted alphabetically for easier navigation and maintenance.
