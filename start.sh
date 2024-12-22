#!/bin/bash
source venv/bin/activate
gunicorn --bind 0.0.0.0:5100 app:app
