# 🕵️‍♂️ JavaScript Endpoint Extractor for Bug Bounty Recon

This tool automates the process of extracting hidden or undocumented endpoints from JavaScript files during recon. It's tailored for bug bounty hunters and red teamers who want to uncover API routes and internal paths for exploitation.

## ✨ Features

- Extracts endpoints using [LinkFinder](https://github.com/GerbenJavado/LinkFinder)
- Auto-maps relative paths to full URLs using JS file source
- Supports full and relative URLs
- Works with thousands of JS files
- Output ready for use with tools like Burp Suite, httpx, ffuf, nuclei

## 📦 Requirements

- `python3`
- [LinkFinder](https://github.com/GerbenJavado/LinkFinder)
- `httpx` (optional for live testing)

Install dependencies:
```bash
pip install -r https://raw.githubusercontent.com/GerbenJavado/LinkFinder/master/requirements.txt
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
