
size (500, 500);
smooth();
background(154,218,224);
noStroke();
 
for (int y=32; y<=height; y+=8) {
  for (int x= 35; x<=width; x+=76) {
 
 
 
    fill(76,89,90);
    ellipse(y, x, x/10.0, 30-y/5.0);
 
 
 
    fill(41,51,52);
    ellipse(x+y, y, y/10.0, 16-y/10.0);
  }
}


