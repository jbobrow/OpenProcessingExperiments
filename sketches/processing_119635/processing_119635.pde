
//abby frankola
//afrankol
//copyright 2013

float cx, cy, cd, cxSpeed, cySpeed;
float sx, sy, sSize, sxSpeed, sySpeed;
  
void setup() {
  size(400, 400);
  noStroke();
  cx = random(width);
  cy = random(height);
  cd = 100;
  cxSpeed = random(2, 4);
  cySpeed = 2;
    
  sx = random(width);
  sy = random(height);
  sSize = 40;
  sxSpeed = random(2, 4);
  sySpeed = 2;
}
  
void draw() {
  prepWindow();
  drawRect(cx, cy, cd);
  moveRect();
  drawCircle(sx, sy, sSize);
  moveCircle();
}
  
void prepWindow() {
  fill(245, 250, 250, 20);
  noStroke();
  rectMode(CORNER);
  rect(0, 0, width, height);
}
  
void drawRect(float x, float y, float d) {
  fill(245, 250, 250);
  stroke (47 , 122, 83);
  strokeWeight(15);
  rect(x, y, d/2, d/2);
  rectMode(CENTER);
 
}
  
void moveRect() {
  cx += cxSpeed;
  cy += cySpeed;
  if (cx > width) {
    cxSpeed = -cxSpeed;
  } else if (cx < 0) {
    cxSpeed = -cxSpeed;
  };
  if (cy > height) {
    cySpeed = -cySpeed;
  } else if (cy < 0) {
    cySpeed = -cySpeed;
  }
}
  
void drawCircle(float x, float y, float sSize) {
  fill(191, 57, 127);
  stroke (255);
  strokeWeight(5);
  ellipse(x, y, sSize/3.5, sSize/3.5);
}
  
void moveCircle() {
  sx += sxSpeed;
  sy += sySpeed;
  if (sx > width) {
    sx = 0;
  };
  if (sy > height) {
    sy = -sySpeed;
  }
}
    
void keyPressed() {
  if (cx > width || cy > width) {
    cxSpeed = random(-4, -2);
  } else {
    cxSpeed = random(2, 4);
  }
  sy = random(height);
  sySpeed = random(2, 4);
}



