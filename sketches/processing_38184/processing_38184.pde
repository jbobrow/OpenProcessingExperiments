
float x;
float y;
float vx;
float vy;
float r = 20;
float g = 0.3;
boolean mp0;

void setup() {
  size(800, 600);
  x = width / 2;
  y = height / 2;
  smooth();
  noStroke();
  fill(0,128,0);
}

void draw() {
  background(255);

  if (mousePressed) {
    x = mouseX;
    y = mouseY;
    vx = vy = 0;
    mp0 = true;
  } 
  else if(mp0){
    vx = mouseX - x;
    vy = mouseY - y;
    mp0 = false;
  }
  else {
    vy += g;
    x += vx;
    y += vy;
    if (y < 0){
      y = 0;
      vy = -0.9 * vy;
    }
    else if (y > height) {
      y = height;
      vy = -0.9 * vy;
    }
    if(x < 0){
      x = 0;
      vx = -0.9 * vx;
    }
    else if(x > width){
      x = width;
      vx = -0.9 * vx;
    }
  }
  ellipse(x, y, r, r);
}


