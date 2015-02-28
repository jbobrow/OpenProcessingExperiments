
float r;
float g;
float b;
float space = width/20;
float grow = 255;
 
size(300, 300);
background(255);
smooth();
 
for (float x = space; x <= width-space; x = x + random(space)) {
 
  for (float y = space; y <= height-space; y = y + random (space))
 
 
    if (random (y) < 25) {
      rect(x, y, grow, grow);
    }
 
    else {
      ellipse(x, y, grow, grow);
    }
 
 
  grow = random(111);
  r = random(50);
  g = random(100);
  b = random(222);
  fill(r, g, b);
}

