
//ASH Get funky

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
  strokeWeight(2);
  ellipse(200, 200, mouseX, mouseY);
 // float h = random(100); //gives the hue, saturation, and brightness
 // float s = random(100); // random properties
 // float b = random(100);
  fill(frameCount % 150, 255, 150);

}
void keyPressed()
{
  if(key == 'c' || key == 'C')
      background(255);
  if(key == ' ')
      background(0);
}
                
                                                                                                                                                                
