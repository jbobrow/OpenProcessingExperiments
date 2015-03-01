
int eSize=8;

size(400,400);
colorMode(RGB,255);
background(0);

for(int y=-8; y<=400; y+=13){
  for(int x=-8; x<=400; x+=13){
    ellipse(x,y,eSize,eSize);
   fill(y,0,0);
  }
}

for(int i=50; i<=650; i+=50){
  noStroke();
  fill(255,255,255,80);
  ellipse(400,400,i,i);
}

for(int i=50; i<=450; i+=50) { 
  noStroke(); 
  fill(125, 0, 0, 150); 
  ellipse(400, 400, i, i); 
}   

for(int i=50; i<=300; i+=50) { 
  noStroke(); 
  fill(0, 0, 0, 150); 
  ellipse(400, 400, i, i); 
}   



