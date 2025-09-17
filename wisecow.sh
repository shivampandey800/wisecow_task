#!/usr/bin/env bash
# Include Debian games binaries in PATH
export PATH=$PATH:/usr/games

SRVPORT=4499

# Check prerequisites
prerequisites() {
    command -v /usr/games/cowsay >/dev/null 2>&1 &&
    command -v /usr/games/fortune >/dev/null 2>&1 &&
    command -v nc >/dev/null 2>&1 ||
    { echo "Install prerequisites."; exit 1; }
}

# Handle HTTP request
handleRequest() {
    mod=$(/usr/games/fortune)
    body=$(/usr/games/cowsay "$mod")
    cat <<EOF
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: ${#body}

<pre>$body</pre>
EOF
}

# Trap CTRL+C to exit cleanly
trap "echo 'Shutting down...'; exit 0" SIGINT SIGTERM

main() {
    prerequisites
    echo "Wisdom served on port=$SRVPORT..."
    while true; do
        # OpenBSD netcat (-k keep open, -l listen, -p port, -q 1 auto-close after 1 sec)
        handleRequest | nc -l -p $SRVPORT -q 1
    done
}

main

