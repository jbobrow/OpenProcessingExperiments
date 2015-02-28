
size (600,660);
smooth ();
background (255);
fill (#383E2F);
noStroke ();
for (float z = width/3; z<=width; z+=width/3) {
  triangle (z-width/3,0, z,0, z-width/6,height/5);
}
for (float x=width/8; x<=width; x+=width/8) {
  for (float y=height/5; y<=height; y+=height/10) {
    triangle (x-width/8,y, x,y, x-width/16, y+height/10);
  }
}


