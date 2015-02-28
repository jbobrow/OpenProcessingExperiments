
// An array of buttons
Button[] buttons = new Button[6];

void setup() {
  size(600,200);
  smooth();
  // A loop to evenly space out the buttons along the window
  for (int i = 0; i < buttons.length; i++) {
    buttons[i] = new Button(i*100+25,height/2-25,50,50); 
  }
}

void draw() {
  background(255);
  // Show all the buttons
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display(); 
  }
}

void mousePressed() {
  // When the mouse is pressed, we must check every single button
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].click(mouseX,mouseY); 
  }
}




// Button class

class Button  {    

  // Button location and size
  float x;   
  float y;   
  float w;   
  float h;   
  // Is the button on or off?
  boolean on;  

  // Constructor initializes all variables
  Button(float tempX, float tempY, float tempW, float tempH)  {    
    x  = tempX;   
    y  = tempY;   
    w  = tempW;   
    h  = tempH;   
    on = false;  // Button always starts as off
  }    

  void click(int mx, int my) {
    // Check to see if a point is inside the rectangle
    if (mx > x && mx < x + w && my > y && my < y + h) {
      on = !on;
    }
  }

  // Draw the rectangle
  void display() {
    rectMode(CORNER);
    stroke(0);
    // The color changes based on the state of the button
    if (on) {
      fill(175);
    } else {
      fill(0);
    }
    rect(x,y,w,h);
  }
  
} 

