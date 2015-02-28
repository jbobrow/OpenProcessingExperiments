
//Beatriz Bukvic, March 12th, Creative Computing B, Benjamin Bacon

void setup() {
  size(700,700); 
}
 
void draw() {
  background(255);
  noStroke();
  smooth();
   
  for(float yPos = 100; yPos<650 ; yPos+=50) {
    for(float xPos = 100; xPos<650; xPos+=50) {
       
      float distance = dist(xPos, yPos, mouseX, mouseY);
      float circleSize = map(distance, 0, 800, 30, 0);
       
      fill(237, 119, 98);
      ellipse(xPos,yPos,circleSize,circleSize); 
    } 
     
  }
   
   
   
}



