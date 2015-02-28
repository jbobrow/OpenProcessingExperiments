
float oldx;
float oldy;
float a;

float oldx2;
float oldy2;
float b;

void reset() {
  oldx = width / 2;
  oldy = height / 2;
  a = random(TWO_PI);

  oldx2 = width / 2;
  oldy2 = height / 2;
  b = random(TWO_PI)*noise(a);
}

void setup() {
  size(800, 800);
  background (0);
  colorMode(HSB);
  smooth();
  noFill();
  reset();
}
void draw() {
  
  float newx = oldx + cos(a) *6;
  float newy = oldy + sin(a) *5;
  
  strokeWeight(random(3,8));
  stroke(random(150, 250), 355, random(100, 355));
  line(oldx, oldy, newx, newy); 
  
  oldx = newx;
  oldy = newy;
  a = a + random(-0.4, 0.4)*1.5;

  float newx2 = oldx2 + cos(b) *5;
  float newy2 = oldy2 + sin(b) *4;
  
  strokeWeight(random(3,10));
  stroke(random(50, 150), 300, random(100, 355));
  line(oldx2, oldy2, newx2, newy2); 
  
  oldx2 = newx2;
  oldy2 = newy2;
  b = b + random(-0.4, 0.4)*1.8;

  if (oldx < 0 ||oldy < 0 ||oldx > width ||oldy > height) {
    reset();

    if (oldx2 < 0 ||oldy2 < 0 ||oldx2 > width ||oldy2 > height) {
      reset();
    }
  }
  strokeWeight(2);
  stroke(150,355,355,15);
  ellipse(newx2,newy2,40,40);
}




