
float theta = 0;
int radius = 200;
float x, y, centerX, centerY;
PFont font;
float speed;

void setup() {
  size(600, 600);
  centerX = width/2;
  centerY = height/2;
  smooth();
  font = loadFont ("Stencil-48.vlw");
  textAlign(LEFT);
  textFont(font, 12);
  speed = .001;
}

void draw() {
  background(0);
  drawGrid(width/2, height/2);

  noFill();
  ellipse(width/2, height/2, 2*radius, 2*radius);
  x = cos(theta)*radius+centerX;
  y = sin(theta)*radius+centerY;
  noStroke();
  fill(255);
  ellipse(x, y, 20, 20);
  theta = theta + speed;
  noFill();
  stroke(220, 255, 0);
  strokeWeight(2);
  triangle(width/2, height/2, x, y, x, height/2);

  text("Angle in Radians = "+theta, 20, 30);
  text("Angle in Degrees = "+degrees(theta), 20, 50);
  text("Radius = "+radius, 20, 70);

  if (keyPressed) {
    if (key == 'w') {
      speed-=.005;
    }
    if (key == 's') {
      speed+=.005;
    }
    if (key == 'd') {
      speed=0;
    }
    if (key == 'q') {
      radius+=10;
    }
    if (key == 'a') {
      radius-=10;;
    }
  }
}

void drawGrid(float x, float y) {
  stroke(255);
  line(width/2, 0, width/2, width);
  line(0, height/2, height, height/2);
  for (int z = 0; z <= width; z +=10) {
    for (int q = 0; q <= 0; q +=10) {
      line(z, height/2+5, z, height/2-5);
    }
  }
  for (int q = 0; q <= height; q +=10) {
    for (int z = 0; z <= 0; z +=10) {
      line(width/2+5, q, width/2-5, q);
    }
  }
}


