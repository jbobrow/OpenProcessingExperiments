
void setup() {
  size (500, 500);
  smooth();
  noStroke();
}

void draw() {
  //background color map
  background(map(mouseX, 0, 245, 12, 20), map(mouseX, 0, 198, 0, 150), map(mouseX, 0, 124, 0, 255));
  //square color map
  fill(map(mouseX, 0, 500, 255, 0), map(mouseX, 0, 500, 255, 0), map(mouseX, 0, 500, 255, 0));

  float xPos;
  float yPos;
  //rect size
  float rs;
  int rectDistance = 20;

  for (int x=10; x<width; x=x+rectDistance) {
    for (int y=10; y<=height; y=y+rectDistance) {

     
      xPos = x;  // + random(mouseX/50);
      yPos = y; // + random(mouseX/10);
      rs = 15 + random(mouseX/30);
      rect(xPos-10, yPos-10, rs, rs);
    }
  }
}


