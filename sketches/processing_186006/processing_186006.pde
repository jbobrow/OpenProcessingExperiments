
size(400,400);
background(255);


for (int i = 0; i < 400; i = i+10) {
  stroke(120,160,200);
  strokeWeight(5);
  line(0, i, 400, i);
}


for (int i = 0; i < 400; i = i+10){
  
  float r = map(i,0,400,0,255);
  float g = map(i,0,400,255,0);
  
  fill(r,g,0,100);
  ellipse(0,i,400,200);
}

for (int i = 0; i < 400; i = i+10) {
  float r = map(i,0,400,255,0);
  float g = map(i,0,400,0,255);
  fill(g,r,0,100);
  ellipse(400,i,400,200);
}

  
  




