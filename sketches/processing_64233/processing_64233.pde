
float space = width/20;
 
size(300, 300);
background(0);
noStroke();
smooth();
 
for (float x = space; x <= width-space; x = x + random(space)) {
  for (float y = space; y <= height-space; y = y + random (space)) {
 
    float ax = x;
 
    if (random(y) > 100) {
      ax = x - 10;
    }
 
    ellipse(ax, y, 8, 2);
    fill(ax);
  }
}


