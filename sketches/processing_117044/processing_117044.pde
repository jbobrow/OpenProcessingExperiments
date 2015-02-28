
int eSize = 3;

size(510,510);
background(0);
smooth();
noStroke();

for (int y = 0; y <= height; y+=10)
for (int x = 0; x <= width; x+=10){
  stroke(x,x,0);
  fill(100,x,255);
  ellipse(x,y,20,20);
}  

for (int y = 0; y <= height; y+=10)
for (int x = 0; x <= width; x+=10){
  stroke(172);
  noFill();
  ellipse(x,y,10,10);
  

  //ellipse(x,200,200,100);
  
}


