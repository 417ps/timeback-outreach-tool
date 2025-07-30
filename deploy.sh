#!/bin/bash

# Deploy script for Timeback Outreach Tool to Netlify

echo "🚀 Deploying Timeback Outreach Tool to Netlify..."

# Check if we're in the right directory
if [ ! -f "index.html" ]; then
    echo "❌ Error: index.html not found. Make sure you're in the project directory."
    exit 1
fi

# Create Netlify site if not exists
if [ ! -f ".netlify/state.json" ]; then
    echo "📦 Creating new Netlify site..."
    netlify sites:create --name timeback-outreach-tool
fi

# Deploy to production
echo "📤 Deploying to production..."
netlify deploy --prod --dir=.

echo "✅ Deployment complete!"
echo "🌍 Your site should be available at: https://timeback-outreach-tool.netlify.app"