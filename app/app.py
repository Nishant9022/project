from flask import Flask, jsonify

app = Flask(__name__)

@app.get('/')
def home():
    return jsonify(message='Cloud Ops Demo API', status='running')

@app.get('/health')
def health():
    return jsonify(status='healthy', service='cloud-ops-demo'), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
