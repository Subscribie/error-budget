#!/bin/bash

set -x 

# Get all subscribie errors (an error is anything that's not a 200 response
# e.g. a 500, a 404 , ignoring 302 redirects
ERROR_EVENTS=$(journalctl --since "24 hours ago" -u subscribie | grep -e 'HTTP/1.1' | grep -v -e 'HTTP/1.1" 200' | grep -v 'HTTP/1.1" 302'| wc -l)

# Get all subscribie success requests (a success request is a 200 response)
VALID_EVENTS=$(journalctl --since "24 hours ago" -u subscribie | grep -e 'HTTP/1.1"' | wc -l)

echo The math is "$ERROR_EVENTS" / "$VALID_EVENTS"


ERROR_PERCENT=$( echo "scale=2; $ERROR_EVENTS / $VALID_EVENTS" | bc)

echo ERROR_PERCENT is: $ERROR_PERCENT
