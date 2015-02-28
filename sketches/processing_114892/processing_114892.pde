
void setup() {
  size(600,400);
  //noLoop();
}

void draw(){
  //background(255, 051, 204);
  
  for( int yPos = 0; yPos <= height; yPos += height/3) 
     for(int xPos = 0; xPos <= width; xPos = xPos + 10) {
      float distance = dist(mouseX, mouseY, xPos, yPos); 
      fill(xPos*2, mouseX, mouseY);
      ellipse(xPos, yPos, distance, distance);

}

}
