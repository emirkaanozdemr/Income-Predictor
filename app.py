from flask import Flask, render_template, request
import pickle

app = Flask(__name__)
model = pickle.load(open("model.pkl", "rb"))

@app.route('/')
def index():
    return render_template("index.html")

@app.route('/predict', methods=["POST"])
def predict():
    exp=float(request.form.get("experience"))
    exam=float(request.form.get("exam"))
    interview=float(request.form.get("interview"))
    pred=model.predict([[exp, exam, interview]])
    pred_value = pred[0] if isinstance(pred[0], (int, float)) else pred[0][0]
    return render_template("index.html", pred="Your income predicted by AI: ${}".format(pred_value))

if __name__=="__main__":
    app.run(debug=True)
