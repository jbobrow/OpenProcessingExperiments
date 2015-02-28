
float r;
float g;
float b;
float space = width/3;

size(300, 300);
background(255);
float k = random(1, 3);
strokeWeight(k);
stroke(75,25,250);
smooth();

for (float x = space; x <= width-space; x = x + random(space)) {

  for (float y = space; y <= height-space; y = y + random (space)) 
    ellipse(x, y, 8, 8);

  r = random(255);
  g = random(255);
  b = random(255);
  fill(r, g, b);
}




