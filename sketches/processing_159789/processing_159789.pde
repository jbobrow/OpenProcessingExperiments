
float r;
float g;
float b;
float a;

float diam;
float x;
float y;

int state = 1;
int count = 0;

void setup() {
  size(400, 400);
  background(255);
  smooth();
}

void draw() {  
  noStroke();

  if (state == 1) {
    x = random(0, 200);
    y = random(0, 200);
    r = random(255);
    g = random(255);
    b = random(255);
    a = random(255);
    diam = random (20);
    fill(r, g, b, a);
    ellipse(x, y, diam, diam);
    count++;
    if (count == 100) {
      state = 2;
      count = 0;
      background(255);
    }
  }
  if (state == 2) {
    x = random(201, 400);
    y = random(0, 200);
    r = random(255);
    g = random(255);
    b = random(255);
    a = random(255);
    diam = random (20);
    fill(r, g, b, a);
    ellipse(x, y, diam, diam);
    count++;
    if (count == 100) {
      state = 3;
      count = 0;
      background(255);
    }
  }
  if (state == 3) {
    x = random(0, 200);
    y = random(201, 400);
    r = random(255);
    g = random(255);
    b = random(255);
    a = random(255);
    diam = random (20);
    fill(r, g, b, a);
    ellipse(x, y, diam, diam);
    count++;
    if (count == 100) {
      state = 4;
      count = 0;
      background(255);
    }
  }
  if (state == 4) {
    x = random(201, 400);
    y = random(201, 400);
    r = random(255);
    g = random(255);
    b = random(255);
    a = random(255);
    diam = random (20);
    fill(r, g, b, a);
    ellipse(x, y, diam, diam);
    count++;
    if (count == 100) {
      state = 5;
      count = 0;
      background(255);
    }
  }
  if (state == 5) {
    x = random(400);
    y = random(400);
    r = random(255);
    g = random(255);
    b = random(255);
    a = random(255);
    diam = random (20);
    fill(r, g, b, a);
    ellipse(x, y, diam, diam);
    count++;
    if (count == 200) {
      state = 1;
      count = 0;
      background(255);
    }
  }
}

