
float r;
float g;
float b;
float space = width/3;
float big = 30;

size(300, 300);
background(255);
noStroke();
smooth();

for (float x = space; x <= width-space; x = x + random(space)) {

  for (float y = space; y <= height-space; y = y + random (space)) 
    ellipse(x, y, big, big);
  big = random (30);

  r = random(100);
  g = random(255);
  b = random(100);
  fill(r, g, b);
}




