
int boxes = 0;

void setup() {
  size(400, 400);
  background(#167108);
}

void draw() {
  boxes = 0;
  noStroke();
  for (int x=0; x<width; x=x+12) { 
    for (int y=0; y<height; y=y+12) {
      
      if (x > width/2) {
        fill(255, 0, 0);
      } else {
        fill(255);
      }
      
      float rotationAngle = map(mouseX,0,width,0,360);
      rotate(rotationAngle);
      
      rect(x, y, 10, 10);
      boxes ++;
    }
  }
  println("we have this many boxes:"+boxes);
}

