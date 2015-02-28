
void setup() {
  size(500, 500);
  background(255);
  smooth();
  noStroke();
  fill(250,20,220,90);
  int Space = 50;
   
  for (int xPos = 0; xPos <= height; xPos += 50) {
  for (int yPos = 0; yPos <= width; yPos += 50) {
  triangle(xPos, yPos + Space, xPos + Space, yPos, xPos, yPos);
    }
  }
  for (int xPos = 0; xPos <= height; xPos += 50) {
  for (int yPos = 0; yPos <= width; yPos += 50) {
  fill(20,220,250,90);
  triangle(xPos + Space, yPos + Space, xPos + Space, yPos, xPos, yPos);
     }
  }
}


