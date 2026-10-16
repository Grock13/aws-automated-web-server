#!/bin/bash

SERVER=$1

echo "Checking server: $SERVER"

echo ""
echo "Main site:"
curl -I http://$SERVER

echo ""
echo "Health endpoint:"
curl http://$SERVER/health/

echo ""
echo "Done"
