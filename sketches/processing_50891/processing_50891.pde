
size(800, 800);
background(0);
smooth();

noFill();
for (int x=200; x<=width; x+=30) {
  for (int y=0; y<=height; y+=30) {
  stroke(23, 114, 163, 60);
  arc (0, 0, x/0.5+y, y*15, 0, radians(190)) ;
  }
}


