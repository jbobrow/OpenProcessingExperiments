
void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 80);
}

void draw() {
  noStroke();
  fill(0,0,10, 70);
  
  x = random(width/2) + width/4;
  y = random(height/2) + height/4;
  translate(x, y);
  if (abs(x-width/2) < 30 && abs(y-height/2) < 30) {
    angle = random(2*PI);
  } else if (random(1000) > 500) {
    return;
  } else if (random(1000) > 10) {
    angle = atan2((y-height/2), (x-width/2)) + random(PI) + PI/2;
  } else {
    angle = random(2*PI);
  }
  rotate(angle);
  triangle(-70, -2, 40, 0, -70, 2);
  triangle(-72, -4, -65, 0, -72, 4);
}
