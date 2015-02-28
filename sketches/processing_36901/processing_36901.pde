
int xPos;
int yPos;

void setup() {
  size(500, 500);
  xPos = width/2;
  yPos = height/2;
}



void draw() {
  fill(255, 255, 0, 5);
  rect(0, 0, width, height);

  noFill();
  stroke(random(0,255),0,0);

  float x1  = xPos;
  float y1  = yPos;
  float cx1 = xPos+(10*random(-millis()/200.0, millis()/200.0));
  float cy1 = yPos+(10*random(-millis()/200.0, millis()/200.0));
  float cx2 = xPos+(10*random(-millis()/200.0, millis()/200.0));
  float cy2 = yPos+(10*random(-millis()/200.0, millis()/200.0));
  float x2  = xPos+random(-100,100);
  float y2  = xPos+ random(-100,100);

  bezier(x1, y1, cx1, cy1, cx2, cy2, x2, y2);
}


