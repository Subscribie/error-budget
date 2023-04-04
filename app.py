from flask import Flask, jsonify
import subprocess

app = Flask(__name__)


@app.route("/error_percentage", methods=["GET"])
@app.route("/error-rate", methods=["GET"])
def get_error_percentage():
    script_path = "error_percentage.sh"

    try:
        output = subprocess.check_output(["bash", script_path], text=True)
        error_percentage = float(output.strip().split(":")[-1].strip())
        return jsonify({"error_percentage": error_percentage})
    except subprocess.CalledProcessError as e:
        return (
            jsonify({"error": f"Error occurred while executing the Bash script. {e}"}),
            500,
        )


if __name__ == "__main__":
    app.run()
