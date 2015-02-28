


size(500, 500);
int step = width/10;

background(255,255,255);


smooth();
fill(0,255,250);
noStroke();
for (int x = 50; x < width -10; x=x+step) {
  for (int y = 50; y < width -10; y=y+step) {
    ellipse (x, y, 10, 10);
 
 
  }
}


