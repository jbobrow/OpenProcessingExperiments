
boolean button = false;

int x = 50;
int y = 50;
int w = 100;
int h = 75;

void setup() {
  size(200,200); 
}

void draw() {
  if (button) {
    background(183,255,241);
    stroke(0);
  } else {
    background(255,240,183);
    stroke(255);
  }
  
  fill(255,162,213);
  rect(x,y,w,h);
}

// When the mouse is pressed, the state of the button is toggled.   
// Try moving this code to draw() like in the rollover example.  What goes wrong?
void mousePressed() {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    button = !button;
  }  
}


