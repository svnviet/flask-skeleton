#!/usr/bin/env python
import click

from app import create_app

app = create_app()


# flask cli context setup
@app.shell_context_processor
def get_context():
    """Objects exposed here will be automatically available from the shell."""
    return dict(app=app)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
