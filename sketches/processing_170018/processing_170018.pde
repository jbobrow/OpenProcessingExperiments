
size(400, 400);
background(0);
 
for (int x=0; x<=400; x+=7) {//migi
  for (int z=0; z<=400; z+=50) {
      if(z >= 0 && z <= 150){
      stroke(255, 255, 255, 200);
      }
      else{
      stroke(250, 50, 50, 250);//r
      }
      line(400, z, x, 400);
  }
}
for (int x=0; x<=400; x+=7) {//hidari
  for (int z=0; z<=400; z+=50) {
      if(z >= 0 && z <= 150){
      stroke(255, 255, 255, 200);
      }
      else{
      stroke(250, 50, 100, 100);//b
      }
      line(0, 400-z, x, 0);
  }
}
for (int y=0; y<=400; y+=7) {//sit
  for (int z=0; z<=400; z+=50) {
      if(z >= 0 && z <= 150){
      stroke(255, 255, 255, 200);
      }
      else{
      stroke(250, 255, 255, 200);//y
      }
      line(400-z, 400, 0, y);
  }
}
for (int y=0; y<=400; y+=7) {//ue
  for (int z=0; z<=400; z+=50) {
      if(z >= 0 && z <= 150){
      stroke(255, 255, 255, 200);
      }
      else{
      stroke(255, 255, 255, 200);//g
      }
      line(z, 0, 400, y);
  }
}
/*
for (int i=0; i<=400; i+=10) {
  rectMode(CENTER);
  noFill();
  rect(width/2, height/2, i, i);
}
*/


