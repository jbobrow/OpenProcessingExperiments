
float x, y, counter;
color c, d;

void setup() {
  size(500, 500);
  background(0);
  x = 0;
  y = 0;
  counter = 0;
  c = colorC();
  d = colorD();
  frameRate(120);
}
color colorC() {
  float r = random(0, 200);
  float g = random(0, 200);
  float b = random(0, 200);

  color c = color (r, g, b);
  return (c);
}
color colorD() {
  float r = random(0, 200);
  float g = random(0, 200);
  float b = random(0, 200);

  color d = color (r, g, b);
  return (d);
}

void update() {
  if (counter>= PI) {
    c = colorC();
    d = colorD();
    counter = 0;
  }
}

void draw() {
  noStroke();

  update();

  counter += radians(.5); 
  translate(250, 250);

  fill(c);
  rect(x, y, 100 * cos(counter), 100 *  sin(counter));

  fill(d);
  rect(x, y, -100 * cos(counter), -100 * sin(counter));
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      y -= 5;
    } 
    if (keyCode == DOWN) {
      y += 5;
    }
    if (keyCode == LEFT) {
      x -= 5;
    }
    if (keyCode == RIGHT) {
      x += 5;
    }
  }
}



