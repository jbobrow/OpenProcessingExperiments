
void setup() {
  size (500, 500);
  fill(250, 250, 250);
  smooth();
  noStroke();
}
 
void draw() {
  background(227, 14, 217);
  fill(15, 255, 241);
  float xPos;
  float yPos;
  int circleSize = 50;
  int circleDistance = 25;
 
  for (int x = 10; x<= width; x = x+circleDistance) { 
  for (int y=10; y<=height; y=y+circleDistance) {
 
    
      xPos = x + random(mouseX/100);
      yPos = y + random(mouseX/300);
 fill(15, 255, 241);
      triangle (xPos, yPos, 10, 10, 10, 5);
    
    translate (500, 0);
    scale (-1,1);
    
    
   fill (57, 1, 137);
    triangle ( xPos, yPos, 5, 5, 3, 5);
    
  fill (250, 180, 3);
    triangle ( xPos, yPos, 2, 2, 2, 5);
    

  }
  }
}
