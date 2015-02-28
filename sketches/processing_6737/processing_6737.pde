
size (180,150);
background(200);
smooth();
fill(230);
noStroke();
triangle (0,height, width/2,0, width,height);
fill (255);

for (float x=width/2; x<=width; x+=width/2) {
  for (float y=0; y<=2*height/3; y+=height/3) {
    triangle (x-width/12,y, x-5*width/12,y, x-3*width/12,y+height/3);
  }
}


