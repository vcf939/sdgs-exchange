# SDGs Exchange

Cloudflare Pages: branch main; framework None; build command npm run build; output directory public; root directory blank.

The build expands site-source.json into public/, functions/ and lib/. D1 binding DB is configured in wrangler.toml. Set ADMIN_TOKEN and OPERATOR_TOKEN as different production secrets and redeploy. Import the separately supplied cards.json from /admin. No card data or passwords are included.
