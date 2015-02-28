
float space = width/25;

size(300, 300);
background(200);
strokeWeight(1);
smooth();

for (float x = space; x <= width-space; x = x + random(space)) {
  for (float y = space; y <= height-space; y = y + random (space)) {
    
    float ax = x;

  if (random(y) > 100) {
    ax = x - 33;
  }

  else {
    ax = x + 10;
  }


  rect(ax, y, 5, 5);
  fill(ax);
}
}

