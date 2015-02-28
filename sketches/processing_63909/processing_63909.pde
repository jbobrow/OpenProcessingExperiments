

size(500, 500);
float step = width/100;

background(255,255,255);


smooth();
fill(255,255,0);
noStroke();
for (float x = 0; x < width; x=x+step) {
  for (float y = 0; y < height; y=y+step) {
    ellipse (x, random(y), 10, 10);
 
 
  }
}


