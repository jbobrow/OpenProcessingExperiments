
void setup () {
  size(400, 400);
  background(255);
} 

void draw () {
  background(255);

  int faceX = 90;
  int faceY = 40;

  strokeWeight(10);
  line(85 + faceX, 60 + faceY, 85 + faceX, 110 + faceY);
  curve(-90 + faceX, 10 + faceY, 10 + faceX, 140 + faceY, 160 + faceX, 140 + faceY, 510 + faceX, 10 + faceY);
  
  
  fill(255);
  strokeWeight(1);
  rect(faceX, faceY, 70, 70);
  rect(faceX + 100, faceY, 70, 70);

  int xBoundLeft1 = 10 + faceX;
  int xBoundRight1 = 60 + faceX;
  int yBoundTop1 = 10 + faceY;
  int yBoundBottom1 = 60 + faceY;

  int x1 = xBoundLeft1;
  int y1 = yBoundTop1;

  if (mouseX > xBoundRight1) {
    x1 = xBoundRight1;
  } 
  else if (mouseX > xBoundLeft1) {
    x1 = mouseX;
  }
  if (mouseY > yBoundBottom1) {
    y1 = yBoundBottom1;
  } 
  else if (mouseY > yBoundTop1) {
    y1 = mouseY;
  }

  fill(0);
  ellipse(x1, y1, 10, 10);

  int xBoundLeft2 = 110 + faceX;
  int xBoundRight2 = 160 + faceX;
  int yBoundTop2 = 10 + faceY;
  int yBoundBottom2 = 60 + faceY;

  int x2 = xBoundLeft2;
  int y2 = yBoundTop2;

  if (mouseX > xBoundRight2) {
    x2 = xBoundRight2;
  } 
  else if (mouseX > xBoundLeft2) {
    x2 = mouseX;
  }
  if (mouseY > yBoundBottom2) {
    y2 = yBoundBottom2;
  } 
  else if (mouseY > yBoundTop2) {
    y2 = mouseY;
  }

  fill(0);
  ellipse(x2, y2, 10, 10);
}



