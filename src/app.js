const express = require('express');
const app=express();
app.get('/',()=>{
  return 'assaf'
})

app.listen(8090,()=>{
  console.log('listeting on 8080')

})
