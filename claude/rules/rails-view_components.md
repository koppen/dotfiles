---
paths:
  - "app/components/**/*.rb"
  - "app/components/**/*.erb"
  - "app/components/**/*.slim"
---

- Don't use a `Component` suffix for view components. `Button` not `ButtonComponent`.
- Use a `Ui` namespace for all view components. `Ui::Button` not `Button`.
