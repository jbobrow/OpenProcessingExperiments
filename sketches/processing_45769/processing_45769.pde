
 // A to th e S to the H           
  void setup() {
  size(400,400);
  smooth();
  background(255);
  colorMode(HSB);
}
  
void draw() {
  filter(ERODE);
    
  if (mousePressed) {
    filter(DILATE);
  } else {
    filter(BLUR);
  }
    
  stroke(frameCount % 255, 255, 255);
  strokeWeight(25);
  line(200, 200, mouseX, mouseY);  
}
void keyPressed()
{
  if(key == 'w' || key == 'W')
      background(255);
  if(key == 'b'|| key == 'B')
      background(0);
  if(key == ' ')
  strokeWeight(2);
  ellipse(200, 200, mouseX, mouseY);
  fill(frameCount % 150, 255, 150);
} 

                                                                                                                                    
