
size(800, 800);
smooth();
background(255);

for (int x=0; x<=width; x+=10){
  for (int y=0; y<=width; y+=10){
    
  stroke(225, 0, 27);
  ellipse(x, y, 20-x/10, 20-y/10);
  }
}


