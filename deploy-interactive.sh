#!/bin/bash

# Interactive deployment script for Timeback Outreach Tool

echo "🚀 Deploying Timeback Outreach Tool to Netlify..."

# Check if we're in the right directory
if [ ! -f "index.html" ]; then
    echo "❌ Error: index.html not found. Make sure you're in the project directory."
    exit 1
fi

# Create site with answers to prompts
echo "📦 Creating Netlify site..."

# Use expect to handle interactive prompts, or try manual deployment
if command -v expect >/dev/null 2>&1; then
    expect << EOF
spawn netlify sites:create --name timeback-outreach-tool
expect "Team:"
send "\r"
expect "Project name"
send "timeback-outreach-tool\r"
expect eof
EOF
else
    echo "⚠️ 'expect' not found. Creating site manually..."
    echo "Please run: netlify sites:create --name timeback-outreach-tool"
    echo "Then select your team and use 'timeback-outreach-tool' as the project name"
    read -p "Press Enter after creating the site..."
fi

# Deploy to production
echo "📤 Deploying to production..."
netlify deploy --prod --dir=.

echo "✅ Deployment complete!"
echo "🌍 Check your Netlify dashboard for the live URL"