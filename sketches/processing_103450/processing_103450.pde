
int x, y,timeout;
PVector tempMouse, tempSpot;
ArrayList squares;


void setup() {
  size(500,400);
  background(0);
  stroke(255);
  noFill();
  noCursor();
  frameRate(150);
  timeout = 0;
  tempMouse = new PVector(0,0);
  tempSpot = new PVector(0,0);
  squares = new ArrayList();
}

void draw() {
  background(0);
  if (mousePressed) {
    if ((millis()-timeout)>100) {
      timeout= millis();
      squares.add(new PVector(mouseX-5,mouseY-5));
    }
  }  
  for (int i = 0; i<squares.size();i++) {
    fill(100);
    PVector tempSpot = (PVector) squares.get(i);
    rect(tempSpot.x,tempSpot.y,10,10);
    noFill();
  }
  rect(mouseX-5,mouseY-5,10,10);
  
}



