
size (310, 310);
background (255);
smooth ();

for (int x=10; x<300; x += 30) {
  for (int y=10; y<300; y +=30) {
    float greyVal = map (y, 0,300, 265,0);
    fill (greyVal);
    triangle (x, y, (x+20), y, (x+10), (y+20));
  }
}               
