import express from "express";

const app = express();
const port = process.env.PORT || 3000;

// Health check route for ECS/ALB
app.get("/health", (req, res) => res.status(200).send("ok"));

// Example root route
app.get("/", (req, res) => {
  res.send("Hello from myApp01 on ECS Fargate!");
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
