# SDGs Exchange

Cloudflare Pages: branch main; framework None; build command npm run build; output directory public; root directory blank.

The build expands site-source.json into public/, functions/ and lib/. D1 binding DB is configured in wrangler.toml. Set ADMIN_TOKEN and OPERATOR_TOKEN as different production secrets and redeploy. Import the separately supplied cards.json from /admin. No card data or passwords are included.

## Dated activities
For a NEW database: execute schema.sql, then migration-002-activities.sql exactly once before first use. For an existing pre-activities database: back up first, then execute only migration-002-activities.sql once. The production database has already been migrated; do not repeat ALTER TABLE commands.

In /admin, set the current activity name and date. Pause or enter reflection before archiving. Archive the current activity before creating the next one. New activities start at 3/3/3 with 16 groups and copy the previous card catalog. Historical activities are read-only and can be selected by date and exported with their card snapshot. Public exchange/dashboard always follow the current activity; historical admin viewing does not switch it.
