---
paths:
  - "**/*.rb"
  - "app/"
  - "spec/"
---

# Rails conventions
- No business logic in controllers or views
- No after_commit for side effects — use jobs
- Never update_column — skips validations
- Adhere to RESTful conventions - prefer adding a new resource over adding a new action to an existing resource.
- Remember to run specs and rubocop after making changes.

# Testing
- RSpec + FactoryBot, prefer build_stubbed

# Views
- Use https://flowbite-components.substancelab.com for UI components
- Use Rails I18n for all interface texts.
- Prefer readable method names. Instead of `t(".something")` use `translate(".something")`.

# Libraries
- Prefer Rails Authentication generator instead of Devise

# Database migrations
- Generate migrations using rails generate migration, never write them by hand.
- Prefer change method over up/down.
- Migrations should be reversible, if that's not possible add irreversible! to the migration.
