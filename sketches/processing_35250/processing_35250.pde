
void setup() {
  size(200, 200);
  loop();
}

float x = 0;
float y = 0;

void draw() {
    if(mousePressed) {
    stroke(255,255,0);
    strokeWeight(3);
    fill(0,0,255);
  } else {
    stroke(0);
    strokeWeight(0);
    fill(0, 255, 0);
    background(0,0,255);
  }

  x = x + 1;
  if (x > width) {
    x = 0;
  }
  ellipse(x, 100, 20, 20);
  ellipse(x, 150, 20, 20);
  ellipse(x, 50, 20, 20);
  ellipse(x-30, 100, 20, 20);
  ellipse(x-30, 150, 20, 20);
  ellipse(x-30, 50, 20, 20);
  ellipse(200-x, 100, 20, 20);
  ellipse(200-x, 50, 20, 20);
  ellipse(200-x, 150, 20, 20);
  ellipse(230-x, 100, 20, 20);
  ellipse(230-x, 50, 20, 20);
  ellipse(230-x, 150, 20, 20);

  y = y + 1;
  if (y > width) {
    y = 0;
  }
  ellipse(100, y, 20, 20);
  ellipse(50, y, 20, 20);
  ellipse(150, y, 20, 20);
  ellipse(100, y-30, 20, 20);
  ellipse(50, y-30, 20, 20);
  ellipse(150, y-30, 20, 20);
  ellipse(100, 200-y, 20, 20);
  ellipse(50, 200-y, 20, 20);
  ellipse(150, 200-y, 20, 20);
  ellipse(100, 230-y, 20, 20);
  ellipse(50, 230-y, 20, 20);
  ellipse(150, 230-y, 20, 20);
  
}


