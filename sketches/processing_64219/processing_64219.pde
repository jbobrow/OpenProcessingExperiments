
size (500, 500);
float space = 10;





smooth();
background(25, 75, 250);
ellipseMode(CENTER);
for ( float x = 0; x < width - 5 ; x = x + space) {
  for ( float y = 0; y < height + 5; y = y + space) {
    if (random (300) > 50) {

      ellipse(x, y, x + space, y + space);
      stroke(random(250), random(255), random(255));
    }
    else {

      ellipse(x+space, y+space-20, x, y);
      stroke(random(250), random(255), random(255));
    }
  }
}




