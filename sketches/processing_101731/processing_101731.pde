
size(255,255);
background(255);
colorMode(HSB);

//Gradient from black to white
/*for(int y=255; y>=0; y=y-1) {
   stroke(0, 0, y);
   line(0, y, 255, y);
}*/

//from white to black:
int c = 0;

for (int y=255; y>=0; y=y-1) {
  if (c>=0)  {
  c=c+1;
  stroke(0, 0, c);
  line(0, y, 255, y);
  }
}
