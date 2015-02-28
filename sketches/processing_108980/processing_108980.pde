
int count = 1;
int state = 0;
float x = 0;
float y = 0;
float diam = 20;
float r;
float g;
float b;

void setup() {
  size(800, 600);
}

void draw() {
  if (y == height-20) {
    x = 0;
    y = 0;
    state = 0;
  } 
  else if (state == 0) {
    r = random(70, 255);
    g = 0;
    b = 0;
    count++;
    if (count > 5) {
      fill(r, g, b);
      ellipse(x+diam, y+diam, diam, diam);
      x = x + diam;
      count = 0;
    }
    if (x == width-20) {
      x = 0;
      y = y + diam;
      state = 1;
    }
  } 
  else if (state == 1) {
    r = 0;
    g = random(70, 255);
    b = 0;
    count++;
    if (count > 5) {
      fill(r, g, b);
      ellipse(x+diam, y+diam, diam, diam);
      x = x + diam;
      count = 0;
    }
    if (x == width-20) {
      x = 0;
      y = y + diam;
      state = 2;
    }
  } 
  else if (state == 2) {
    r = 0;
    g = 0;
    b = random(70, 255);
    count++;
    if (count > 5) {
      fill(r, g, b);
      ellipse(x+diam, y+diam, diam, diam);
      x = x + diam;
      count = 0;
    }
    if (x == width-20) {
      x = 0;
      y = y + diam;
      state = 0;
    }
  }
}


