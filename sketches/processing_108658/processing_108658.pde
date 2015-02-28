
size(600, 600);
background(#CBCBCB);

noFill();
//fill(#F00000, 20);
for (int i = 0; i < (width+300); i = i+20) {
  //line(30, i, 80, i);
  float p = random(255);
  float a = random(255);
  float c = random(255);
  stroke(255);
  fill(255, c, a, 10);
  ellipse(width/2,height/2, i, i);
  
}

for (int i = 0; i < (width+300); i = i+20) {
  //line(30, i, 80, i);
  stroke(255, 200);
  noFill();
  ellipse(width/2,height/2, i, i);
  
}



