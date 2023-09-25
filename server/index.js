//packages
const express  = require('express');
const mongoose =require('mongoose');
//files
const authRouter=require('./routes/auth');
//init

const PORT=3000;
const app=express();
const DB="mongodb+srv://aadarshshriniwas:aada1234@cluster0.xqwggwf.mongodb.net/?retryWrites=true&w=majority";

app.use(express.json());
app.use(authRouter);
mongoose
.connect(DB)
.then(()=>{
   console.log("Successful");
})
.catch((e)=>{
console.log(e);
});

app.listen(PORT,"0.0.0.0",()=>{
console.log(`Connected at ${PORT}`);
});