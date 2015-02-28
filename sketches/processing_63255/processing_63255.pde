
float space = width/5;

size(300, 300);
background(255);
float k = random(0.3, 5);
strokeWeight(k);
smooth();

for (float x = space; x <= width-space; x = x + random(space)) {

  for (float y = space; y <= height-space; y = y + random (space)) 
    ellipse(x, y, 5, 5);
}



