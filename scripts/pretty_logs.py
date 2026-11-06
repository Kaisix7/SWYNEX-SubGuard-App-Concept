#!/usr/bin/env python3
import sys
import json

# ANSI color codes
GREY = "\033[90m"
GREEN = "\033[92m"
YELLOW = "\033[93m"
RED = "\033[91m"
BLUE = "\033[94m"
CYAN = "\033[96m"
RESET = "\033[0m"

LEVEL_COLORS = {
    "INFO": GREEN,
    "WARNING": YELLOW,
    "ERROR": RED,
    "CRITICAL": RED,
    "DEBUG": GREY,
}

for line in sys.stdin:
    line = line.strip()
    if not line:
        continue
    try:
        data = json.loads(line)
        # Parse standard fields from JSONFormatter
        timestamp = data.get("timestamp", "")
        if timestamp:
            # Shorten timestamp for readability (e.g. 2026-07-08 12:00:00)
            timestamp = timestamp.split(".")[0].replace("T", " ")
        level = data.get("level", "INFO")
        event = data.get("event", "")
        message = data.get("message", "")
        endpoint = data.get("endpoint")
        status = data.get("status")
        resp_time = data.get("response_time")
        
        # Color configuration
        lvl_color = LEVEL_COLORS.get(level, RESET)
        
        # Build prefix
        prefix = f"{GREY}[{timestamp}]{RESET} {lvl_color}[{level}]{RESET}"
        
        # Build details
        details = []
        if event and event != "log_message":
            details.append(f"event={CYAN}{event}{RESET}")
        if endpoint:
            details.append(f"path={BLUE}{endpoint}{RESET}")
        if status is not None:
            # Color status codes (green for 2xx, yellow for 3xx, red for 4xx/5xx)
            stat_color = GREEN if status < 300 else (YELLOW if status < 400 else RED)
            details.append(f"status={stat_color}{status}{RESET}")
        if resp_time is not None:
            details.append(f"time={resp_time}ms")
            
        details_str = f" ({', '.join(details)})" if details else ""
        
        print(f"{prefix} {message}{details_str}")
    except Exception:
        # If it's not JSON, print as is
        print(line)
    sys.stdout.flush()
