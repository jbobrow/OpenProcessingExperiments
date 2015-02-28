

float space = width/20;

size(300, 300);
background(255);
noStroke();
smooth();

for (float x = space; x <= width-space; x = x + random(space)) {
  for (float y = space; y <= height-space; y = y + random (space)) {

    float ax = x;

    if (random(y) > 80) {
      ax = x - 100;
    }

    else {
      ax = x + 100;
    }


    ellipse(ax, y, 3, 3);
    fill(ax);
  }
}



