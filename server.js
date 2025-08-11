const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;


app.get("/health", (_, res) => res.status(200).send("ok"));


app.get("/", (_, res) => {
  res.json({
    message: "Hello from ECS Fargate behind ALB. Thank You!",
    uptime_secs: process.uptime()
  });
});

app.listen(PORT, () => console.log(`Listening on ${PORT}`));
