
float rad;
float xOrigin, yOrigin;
float yPos;
boolean toLeft;

void setup() {
  size(800, 200);
  rad = 50;
  yOrigin = height/2;
  toLeft = false;
}

void draw() {
  background(0);  
  noStroke(); 

  yPos =cos(frameCount * 0.1) * rad;
  ellipse (xOrigin, yOrigin + yPos, 20, 20);

  if (toLeft==false) {
    xOrigin = xOrigin + 5;
    if (xOrigin > 800) {  
      toLeft = true;
    }
  }

  else {
    xOrigin = xOrigin - 5; 
    if (xOrigin < 0) {
      toLeft = false;
    }
  }
}
