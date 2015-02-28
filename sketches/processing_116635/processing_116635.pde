
void setup() {
  size (400, 400);
  fill(255, 255, 255);
  smooth();
  noStroke();
}
 
 
 
void draw() {
 
  background(0, 0, 0);
  fill(0, 0, 0);
  noStroke();
 
  float xPos;
  float yPos;
  int circleSize = 5;
  int circleDistance = 5;
 
  for (int x=1; x<= width; x=x+circleDistance) {
 
    for (int y=1; y<= height; y=y+circleDistance) {
 
      xPos = x + random(mouseX/50);
      yPos = y + random(mouseX/50);
 
      fill(0, 0, 0);
      ellipse(xPos, yPos, 10, 10);
      fill(255, 255, 255);
      ellipse(xPos+20, yPos+20, 10, 10);
    }
  }
}



