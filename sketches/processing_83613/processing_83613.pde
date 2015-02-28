
void setup() {
  size(600, 600);
  
}


void draw() {
  background(0);
  colorMode(HSB);
  int counter=frameCount;

  for (float yPos =0; yPos<600; yPos+=20) {
    for (float xPos = 0; xPos<600; xPos+=20) {
      
      float circleSize = dist(xPos,yPos,mouseX,mouseY);
      
      circleSize = map(circleSize,0,700,20,40);
      
      fill(counter %255, 255, 255);
      ellipse(xPos, yPos, circleSize, circleSize);
      
      counter++;
      
      if (counter>255) {
        counter-=255;
      }
    }
  }
}



