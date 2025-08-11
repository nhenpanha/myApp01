import express from "express";
const app = express();
const port = process.env.PORT || 3000;


app.get("/health", (req, res) => res.status(200).send("ok"));


app.get("/", (req, res) => res.send("Hello from myApp01!"));

app.listen(port, "0.0.0.0", () => {
  console.log(`Server running on ${port}`);
});

