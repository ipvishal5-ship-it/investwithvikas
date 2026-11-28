# Invest with Vikas (investwithvikas.in)

Official website of **Vikas Pawankumar Agarwal**, AMFI-Registered Mutual Fund Distributor.

- **AMFI Registration Number (ARN):** ARN-40434 (Valid till 07-Aug-2027)
- **EUIN:** E375656
- **NISM Certification:** Series V-A: Mutual Fund Distributors (Cert #2430335917)
- **Experience:** About 20 years in Indian financial markets
- **Office Location:** 504 Atlanta Estate, Opp. Oberoi Mall, Western Express Highway, Goregaon East, Mumbai 400063
- **Phone / Call:** +91 99671 29977
- **Email:** info@investwithvikas.in
- **Website:** [https://investwithvikas.in](https://investwithvikas.in)

---

## Complete Website Architecture (All 8 Pages)

### Core Pages
1. `index.html` - Homepage featuring interactive Goal-based investing plant, How It Works 3-stage process, About Vikas Agarwal credentials bento, continuous marquee ticker of 55 active Indian Asset Management Companies (AMCs), FAQ, and contact channels.
2. `how-i-earn.html` - Plain-language Commission Disclosures explaining trail-only distributor remuneration, Regular vs Direct plan expense ratios, and SEBI point-of-sale disclosure norms.
3. `disclosures.html` - Statutory regulatory disclosures, SEBI Investment Adviser vs Distributor distinction, AMFI Code of Conduct, and full investor grievance redressal escalation matrix (SEBI SCORES 2.0 & SMART ODR Portal).
4. `privacy.html` - Comprehensive privacy policy and client data protection practices aligned with the Digital Personal Data Protection (DPDP) Act.

### Investor Zone (4 Dedicated Utilities)
5. `calculators.html` - 6 interactive mathematical wealth calculators:
   - SIP Calculator (Monthly wealth accumulation)
   - Step-Up SIP Calculator (Annual income growth indexed)
   - Lumpsum Growth Calculator (One-time capital deployment)
   - Retirement Corpus Calculator (Inflation-indexed post-retirement corpus)
   - Child Higher Education Calculator (Future college tuition projection)
   - Cost of Delay Calculator (Financial penalty of postponing investing)
6. `kyc.html` - Central KYC (CKYC) Verification Hub routing investors to all 5 SEBI-registered KRAs (CVL, CAMS, KFintech, NSE, NDML) and Income Tax PAN-Aadhaar verification portal.
7. `mf-forms.html` - Mutual Fund Forms & Downloads Hub with search and category filtering, in-browser PDF preview modal, and direct downloads for 12 mutual fund servicing forms (including universal Common Transaction Slip and Change of Bank Mandate generic templates).
8. `mf-tools.html` - Advanced Mutual Fund Research Hub featuring:
   - Real-Time AMFI NAV Tracker with instant live typeahead autocomplete search across 2,500+ mutual fund schemes.
   - Illustrative Mutual Fund Capital Gains Tax Estimator.
   - Past SIP Backtester powered by Investwell.
   - SEBI Category Risk-o-meter Matrix.
   - Central Consolidated Account Statement (CAS) Hub.

---

## Master Reference & Documentation Workbooks

1. `Website_Complete_Documentation.docx` - Master technical architecture, design system, OWASP security, WCAG 2.1 AA accessibility, and regulatory framework documentation.
2. `Vikas_Agarwal_Master_Data_Workbook.xlsx` - **Unified Master Workbook (16 Sheets)** consolidating all project data:
   - **Section 1: Website Data & Audit** (6 Sheets for Homepage, Calculators, MF Tools, KYC Hub, Forms & PDFs, Legal/SEO)
   - **Section 2: Active AMC & RTA Directory** (4 Sheets covering all 55 AMCs, CAMS 26, KFintech 29, Specialized Funds 15)
   - **Section 3: Financial Calculator Master Formulas & Live Models** (5 Sheets for Formula reference, SIP model, Step-Up SIP model, Lumpsum model, Retirement model)

---

## Technical Stack & Security

- **Frontend:** Semantic HTML5, CSS3 (CSS Grid & Flexbox), Vanilla JavaScript (ES6+).
- **Zero Heavy Dependencies:** No bloated frameworks or external JS dependencies.
- **Security:** 100% of external links use `rel="noopener"`, zero mixed HTTP content, client-side calculator execution (no user financial data transmitted or stored).
- **SEO & Structured Data:** Schema.org JSON-LD (`FinancialService`, `LocalBusiness`, `Person`, `FAQPage`, `WebApplication`), Open Graph tags, canonical URLs, `robots.txt`, and `sitemap.xml`.
- **Compliance:** 100% strict AMFI zero-emoji standard, clear Regular Plan distributor disclosure.
- **Deployment Package:** Run `.\build-deploy.ps1` to generate a clean production-only `dist\` folder containing only the static site assets.

---

## Regulatory Notice

Mutual fund investments are subject to market risks. Read all scheme related documents carefully before investing. Past performance is not an indicator of future returns.
