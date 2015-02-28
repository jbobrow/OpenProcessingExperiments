
//  R.A. Robertson 2010.10 "Sparkler" ~ www.rariora.org ~

float x, y, x1, y1, x2, y2, sparkx, sparky;
boolean toggleLoop = true;

void setup() {
  size(400, 400);
  background(0, 0, 5);
  noStroke();
  x = width/2; 
  y = height/2;
}

void draw() {
  fill(0, 0, 25, 20);
  noStroke();
  rect(0, 0, width, height);
  for (int i = 0; i < 10; i++) {
    stroke(255, 40);
    float theta = random(1.95*PI);
    float rad = random (35, 170);
    x1 = x + sin(theta)*rad;
    y1 = x + cos(theta)*rad;
    line(x, y, x1, y1);

    for (int j = 0; j < 5; j++) {
      stroke(255, 150, 10);
      x2 = random(-2, 2);
      y2 = random(-2, 2);
      line(x1, y1, x1 + x2, y1 + y2);
    }
  }
}

// Mouse toggle code by amnon.owed
// http://forum.processing.org/topic/mouse-toggle-loop
void mousePressed() {
  if (toggleLoop) { 
    noLoop(); 
    toggleLoop = false;
  }
  else { 
    loop(); 
    toggleLoop = true;
  }
}

