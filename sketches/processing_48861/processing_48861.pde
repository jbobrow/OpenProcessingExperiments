
int objectsize = 30;
int valueX = 0;
int valueY = 0;
boolean swith = true;
int locationX = 450;
int locationY = 300;
boolean drawcircle = false;

void setup() {
  size(900,450);
  smooth();
  noStroke();
  background(255);
  // noCursor();
}

void draw() {

  if (swith) {
    objectsize = objectsize + 1;
  }
  else {
    objectsize = objectsize - 1;
  }

  fill(valueX, valueY,0);
  ellipse(locationX, locationY,objectsize,objectsize);
  if (objectsize == 100 ) { 
    swith = false;
  }
  if (objectsize == 20 ) { 
    swith = true;
  }
  if(drawcircle) {
    fill(valueX, valueY,0);
    ellipse(random(50,850),random(50,350),objectsize,objectsize);
  }
}

void mouseMoved() {
  valueX = mouseX;
  valueY = mouseY;
  if (valueX > 255) {
    valueX = valueX - 255;
  }
  if (valueY > 255) {
    valueY = valueY - 255;
  }
}

void mouseDragged()
{
  locationX = mouseX;
  locationY = mouseY;
}

void mouseClick() {
  drawcircle = true;
}

void mouseReleased() {
  drawcircle = false;
}

