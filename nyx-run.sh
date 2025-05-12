#!/bin/bash

# Simple script to run common nyx commands

case "$1" in
  "release")
    # Create a new release
    npx nyx release
    ;;
  "info")
    # Display project versioning info
    npx nyx info
    ;;
  "infer")
    # Infer next version (dry run)
    npx nyx infer-version
    ;;
  "plan")
    # Show the release plan
    npx nyx plan
    ;;
  "publish")
    # Release and publish
    npx nyx publish
    ;;
  *)
    echo "Usage: ./nyx-run.sh [command]"
    echo ""
    echo "Available commands:"
    echo "  release  - Create a new release"
    echo "  info     - Display project versioning info"
    echo "  infer    - Infer next version (dry run)"
    echo "  plan     - Show the release plan"
    echo "  publish  - Release and publish"
    ;;
esac 