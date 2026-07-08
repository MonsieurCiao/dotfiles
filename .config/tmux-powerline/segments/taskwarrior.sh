#!/usr/bin/env bash

run_segment() {
    # Check if task command exists
    if ! command -v task &> /dev/null; then
        return 1
    fi

    # Set your threshold for what is considered an "Urgent" score
    local urgency_threshold="9.0"

    # Get counts using an urgency filter expression
    local urgent_count
    local non_urgent_count
    
    urgent_count=$(task status:pending "urgency >= $urgency_threshold" count 2>/dev/null || echo 0)
    non_urgent_count=$(task status:pending "urgency < $urgency_threshold" count 2>/dev/null || echo 0)

    # If there are absolutely no pending tasks
    if [ "$urgent_count" -eq 0 ] && [ "$non_urgent_count" -eq 0 ]; then
        echo "✔"
        return 0
    fi

    local output=""

    # If there are urgent tasks, show the hourglass icon and the count
    if [ "$urgent_count" -gt 0 ]; then
        output+="⧗ ${urgent_count} "
    fi

    # Add the non-urgent count with a plus sign
    output+="+ ${non_urgent_count}"

    echo "$output"
    return 0
}
