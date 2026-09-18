#!/bin/bash
# Automate Tiger CLI setup and MCP agent registration

echo "==> Authenticating Tiger CLI..."
tiger auth login

echo "==> Verifying Tiger Cloud Service Connection..."
tiger service list

echo "==> Installing Tiger MCP for AI Agent..."
tiger mcp install
