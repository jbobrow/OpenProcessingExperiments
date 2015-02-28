
//Assignment 3.
//Hypno Colors.
//It's just my experiment with gradients and rotate(). I wanted create twisted effect.

//Mouse click to create color wheel.
//Mouse drag (left or right) to twist colors.
//Spacebar to start/stop animation.
//S or s to save a screenshot.

float x, y;
float hue;
float angle = 0;
float weight = 40;
boolean started = false;
boolean animation = false;
float speed = 0.01;
int fileCount = 0;

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100);
  x = width/2;
  y = height/2;
  noFill();
  strokeCap(SQUARE);
  strokeWeight(weight);
}

void draw() {
  if (animation) {
    angle+=speed;
  }

  if (started) {
    drawWheel();
  }
}

void mousePressed() {
  started = true;
}

void mouseDragged() {
  angle = map(mouseX, 0, width, -PI, PI);
}

void keyPressed() {

  if (key == ' ') {
    animation = !animation;
    started = true;
  }

  if (key == 's' || key == 'S') saveFrame("screenshot" + fileCount + ".png");
  fileCount++;
}

void drawWheel() {
  pushMatrix();
  translate(x, y);
  for (int i = 0; i < 1000; i+=weight) {
    rotate(angle);
    for (float j = 0; j < TWO_PI; j+=TWO_PI/32) {
      hue = map(j, 0, TWO_PI, 0, 359);
      stroke(hue, 100, 100);
      arc(0, 0, i, i, j, j + TWO_PI/32);
    }
  }
  popMatrix();
}  



