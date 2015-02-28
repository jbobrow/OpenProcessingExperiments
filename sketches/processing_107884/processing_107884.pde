
// Circular motion
void setup() {
  size(200, 200);
}
 
void draw() {
  background (127); 
  smooth();

  
  line (0,0, mouseX, mouseY); 
  ellipse(mouseX, mouseY, 20, 20);
 
  float centerX   = width/2;
  float centerY   = height/2;
  float amplitude = 50.0;
  float period    = 0.003;
 
  // Circular motion linked to the (time-varying) millis() function. 
  // Note that millis() gets large fast (1000 per second!), 
  // so we have to multiply it by a small number to work well.
  float xPos = centerX + amplitude * sin(millis()*period);
  float yPos = centerY + amplitude * cos(millis()*period);
  line (centerX, centerY, xPos, yPos); 
  ellipse(xPos, yPos, 20, 20);
  
  
}
