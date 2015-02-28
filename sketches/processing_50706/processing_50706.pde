
class Button  {    

  // Button location and size
  float x;   
  float y;   
  float w;   
  float h;   
  
  color dim;
  color lit;
  // Is the button on or off?
  boolean on;  

  // Constructor initializes all variables
  Button()  {    
    x  = buttonX;   
    y  = buttonY;   
    w  = 60;   
    h  = 60;   
    on = false;  // Button always starts as off
    dim= color (100,0,0);
    lit= color (255,0,0);
}    

  void click(int mouseX, int mouseY) {
    // Check to see if a point is inside the circle
    if (mouseX > 202 && mouseX < 202 + w && mouseY > 290 && mouseY < 290 + h) {
      on = !on;
    }
  }

  // Draw the circle
  void display() {
    ellipseMode(CENTER);
    noStroke();
    fill(100);
    ellipse(x,y,w+10,h+10);
    
    // The color changes based on the state of the button
    if (on) {
      fill(lit);
    } else {
      fill(dim);
    }
    ellipse(x,y,w,h);
  }
  
} 

