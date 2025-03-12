const express = require("express");
const app = express();
const port = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.send("Hello from Node.js on Kubernetes! I Luv U <33 Tag 1.0.3");
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
