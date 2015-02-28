
float x, y, gaussX, gaussY;
float offset = 30;
int step = 5;
boolean toggleLoop;

void setup() {
  size(400, 400);
  frameRate(2000);
  background(100, 50, 0);
  stroke(255, 10);
  x = random(width);
  y = random(height);
}

void draw() {
//  x += random(-step, step);
//  y += random(-step, step);
  x += randomGaussian() * step;
  y += randomGaussian() * step;
  x = constrain(x, 0, width);
  y = constrain(y, 0, height);
  gaussX = x + (randomGaussian() * offset);
  gaussY = y + (randomGaussian() * offset);
//  strokeWeight(int(random(3)));
  point(gaussX, gaussY);
  pushStyle();
    stroke(20, 150, 150, 20);
    strokeWeight(4);
    point(x, y);
//    stroke(0, 10);                      // Shading.
//    point(x + 1, y + 1);
  popStyle();
}

void keyPressed() {
  if (key == 'b' || key == 'B') filter(BLUR, 0.58);
  if (key == 'i' || key == 'I') saveFrame("randomGaussian_####.jpg"); 
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (toggleLoop) {
      noLoop();
      toggleLoop = false;
    }
    else {
      loop();
      toggleLoop = true;
    }
  }
}


