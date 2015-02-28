
float xmin;
float ymin;
float wh;

void setup() {
  size(900, 900, P2D);
  background(255);
  loadPixels();
}

void draw() {
  if (keyPressed) {
    if (key == '1') {
      xmin = -1.95;
    }
    if (key == '2') {
      xmin = -1.796;
    }
    if (key == '3') {
      xmin = -1.1;
    }
    if (key == '4') {
      xmin = -.81;
    }
    if (key == '5') {
      xmin = -.65;
    }
    if (key == '6') {
      xmin = -1.013;
    }
    if (key == '7') {
      xmin = .23;
    }
    if (key == '8') {
      xmin = .248;
    }
    if (key == '9') {
      xmin = .258;
    }
  } else {
    xmin = -2.5;
  }
  if (keyPressed) {
    if (key == '1') {
      ymin = -.125;
    }
    if (key == '2') {
      ymin = -.025;
    }
    if (key == '3') {
      ymin = -.50;
    }
    if (key == '4') {
      ymin = -.15;
    }
    if (key == '5') {
      ymin = -.71;
    }
    if (key == '6') {
      ymin = -.3155;
    }
    if (key == '7') {
      ymin = -.48;
    }
    if (key == '8') {
      ymin = -.125;
    }
    if (key == '9') {
      ymin = -.005;
    }
  } else {
    ymin = -2.0;
  }
  if (keyPressed) {
    if (key == '1') {
      wh = .25;
    }
    if (key == '2') {
      wh = .055;
    }
    if (key == '3') {
      wh = .5;
    }
    if (key == '4') {
      wh = .1;
    }
    if (key == '5') {
      wh = .2;
    }
    if (key == '6') {
      wh = .01;
    }
    if (key == '7') {
      wh = .25;
    }
    if (key == '8') {
      wh = .25;
    }
    if (key == '9') {
      wh = .01;
    }
  } else {
    wh = 4;
  }
  int maxiter = 200;
  float xmax = xmin + wh;
  float ymax = ymin + wh;
  float dx = (xmax - xmin) / (width);
  float dy = (ymax - ymin) / (height);
  
  float y = ymin;
  for (int j = 0; j < height; j++) {
    float x = xmin;
    for (int i = 0; i < width; i++) {
      
      float a = x;
      float b = y;
      int n = 0;
      while ( n < maxiter) {
        float aa = a * a;
        float bb = b * b;
        float twoab = 2.0 * a * b;
        a = aa - bb + x;
        b = twoab + y;
        if(aa + bb > 16.0) {
          break;
        }
        n++;
      }
      
      if (n == maxiter) {
        pixels[i+j*width] = 0;
      } else {
        if (mousePressed && (mouseButton == LEFT)) {
          pixels[i+j*width] = color(n*5 % 255, n*30 % 255, n*50 % 255);
        } else if (mousePressed && (mouseButton == RIGHT)) {
          pixels[i+j*width] = color(n*50 % 255, n*5 % 255, n*15 % 255);
        } else {
          pixels[i+j*width] = color(n*30 % 255, 0, n*50 % 255);
        }
      }
      x += dx;
    }
    y += dy;
  }
  updatePixels();
  noFill();
  if (keyPressed) {
    if (key == '0') {
      stroke(255);
    }
  } else {
    noStroke();
  }
  rectMode(CENTER);
  rect(150, 450, 55, 55);
  rect(166, 450, 13, 13);
  rect(375, 390, 110, 110);
  rect(390, 430, 20, 20);
  rect(439, 313, 43, 43);
  rect(292, 378, 8, 8);
  rect(645, 373, 55, 55);
  rect(645, 450, 55, 55);
  rect(623, 450, 8, 8);
  if (keyPressed) {
    if (key == '0') {
      text("1", 120, 420);
      text("2", 150, 450);
      text("3", 325, 350);
      text("4", 385, 415);
      text("5", 405, 300);
      text("6", 290, 370);
      text("7", 675, 355);
      text("8", 675, 430);
      text("9", 633, 455);
    }
  } else {
  }
}


