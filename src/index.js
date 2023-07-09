const express = require("express");

const app = express();

const PORT=process.env.PORT || 3000;

app.get("/", (req, res) => {
    return res.send({message: "Hello from ExpressJS!"}).status(200);
});

app.listen(PORT, () => {
    console.log(`Listening on port ${PORT}`);
});