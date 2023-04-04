# Subscribie Error Percentage Checker

This project provides a simple Flask web application that calculates the error percentage of HTTP requests in the logs of the "subscribie" service within the last 24 hours. The application calls a Bash script to analyze the logs using journalctl, grep, and wc, and returns the error percentage as a JSON object.

# Prerequisites

- Python 3.7 or higher
- Bash
- Access to the logs of the "subscribie" service via journalctl



# Installation
Clone the repository

```
python3 -m venv venv
pip install -r requirements.txt
```

# Usage

```
flask run
```

The Flask app will start on http://127.0.0.1:5000/ by default. Access the error percentage by visiting the following endpoint:

```
http://127.0.0.1:5000/error_percentage
```

# Files
- `app.py` - The Flask application that calls the Bash script and serves the error percentage through an API endpoint.
- `error_percentage.sh` - The Bash script that calculates the error percentage by analyzing the "subscribie" service logs within the last 24 hours.
