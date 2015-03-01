
float beginX = 20.0;
float beginAx = 120.0;
float beginBx = 10.0;
float beginBy = 0.0;
float beginY = 10.0;
float beginAy = 110.0;
float endX= 370.0;
float endAx = 400.0;
float endAy = 400.0;
float endY = 380.0;
float endBx =20.0;
float endBy = 300.0;
float distX; 
float distY;
float exponent = 3.0;
float x = 0.0;
float y = 0.0;
float Ax = 0.0;
float Ay = 0.0;
float Bx = 0.0;
float By = 0.0;
float step = 0.01;
float pct = 0.0;
int direction = 1;

void setup() {
  size(400,400);
  noStroke();
  smooth();
  distX = endX - beginX;
  distY = endY - beginY;
}

void draw() {
  fill(0,2);
  rect(0,0,width,height);
  pct += step * direction;
  if ((pct > 1.0) || (pct < 0.0)) {
    direction = direction * -1;
  }
  if (direction == 1) {
    x = beginX + (pct * distX);
    Ax = beginAx + (pct * distX);
    Bx = beginBx + (pct * distX);
    float e = pow(pct, exponent);
    y = beginY + (e*distY);
    Ay = beginAy + (e*distY);
    By = beginBy + (e*distY);
  } else {
    x = beginX + (pct * distX);
    Ax = beginAx + (pct * distX);
    Bx = beginBx + (pct * distX);
    float e = pow(1.0-pct, exponent*2);
    y = beginY + (e * -distY) + distY;
    Ay = beginAy + (e * -distY) + distY;
    By = beginBy + (e * -distY) + distY;
  }
  fill(255, 100, 50, 50);
  ellipse(x*2, y*2, 20, 20);
  fill(100, 255, 80, 80);
  ellipse(Ax*2, Ay*2, 30, 30); 
  fill(80, 90, 255, 50);
  ellipse(Bx, By, 20,20); 
  fill(255, 100, 50, 50);
  ellipse(x, y, 20, 20);
  fill(100, 255, 80, 80);
  ellipse(Ax, Ay, 30, 30); 
  fill(80, 90, 255, 50);
  ellipse(Bx*2, By*2, 20,20);
  fill(255, 100, 50, 50);
  ellipse(x*3, y*3, 20, 20);
  fill(100, 255, 80, 80);
  ellipse(Ax*3, Ay*3, 30, 30); 
  fill(80, 90, 255, 50);
  ellipse(Bx/2, By/2, 20,20); 
  fill(255, 100, 50, 50);
  ellipse(x/2, y/2, 20, 20);
  fill(100/5, 255/5, 80, 80);
  ellipse(Ax*3, Ay*3, 30, 30); 
  fill(80, 90, 255, 50);
  ellipse(Bx*3, By*3, 20,20);
}




