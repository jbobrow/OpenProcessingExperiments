
// experiment2 - playing with lines

void setup() 
  {
  size(900, 510);
  smooth();
  }
  
void draw()  {
    background(mouseY-50/2, mouseX/3, mouseY-mouseX-50);
    for (int y = 60; y <= height-60; y += 130) {
    for (int x = 60; x <= width-60; x += 130) {
    stroke(255, 255, 255);
    noFill();
    float mx = mouseX+mouseY;
    bezier(x, y, mx/3, x-mouseY, x, mouseY/y, mx-x, x-y);
      
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

