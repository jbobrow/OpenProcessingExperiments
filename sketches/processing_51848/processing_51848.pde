
// experiment2 - playing with lines

void setup() 
  {
  size(900, 510);
  background(225, 0, 55);
  smooth();
  }
  
void draw() 
  {
  if (mousePressed) 
  {
  background(225, 0, 55);
  }
    for (int y = 60; y <= height-60; y += 130) {
    for (int x = 60; x <= width-60; x += 130) {
    stroke(255, 255, 255, 255);
    noCursor();
    float mx = mouseX + mouseY;
    line(x, y, mx, mouseY);
        if (keyPressed) {
        line(x, y, mouseY, mouseX);
        }
        {
         pushMatrix();
         translate(x, y);
         stroke(0);
         line(-5, 0, 5, 0);  // Body
         line(0, 5, 0, -5);
         popMatrix();
         }
    }
    }
  }

