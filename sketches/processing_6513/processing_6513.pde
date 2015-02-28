
/*
  Program to draw flower patterns
  
  Left mouse click to place flowers.
  
  Middle mouse click to erase.
*/

// Radius of flower bud
float Cr = 25;
// Radius of the petals
float petalR = 25;
// Offset of petals from bud
float petalOffset = 1;
   
// Sample the mouse
int prevMouseX = 0, prevMouseY = 0;
int samplingFrequency = 73;   

void setup() {
  // Size of my application window
  size(720, 546);
  
  // Background color of the application
  background(0);
  
  // Render with antialiasing
  smooth();
}

int sampleMouse() {
  int diffX = abs(mouseX - prevMouseX);
  int diffY = abs(mouseY - prevMouseY);
  
  if ( diffX < samplingFrequency &&  diffY < samplingFrequency){
    return 0;
  } else {
     return 1;
  }
}

void draw() {
  if (mousePressed && mouseButton == LEFT && (sampleMouse() == 1)) {
    fill(255,0,0);
    ellipse(mouseX, mouseY, Cr, Cr);
    
    prevMouseX = mouseX;
    prevMouseY = mouseY;
    
    float petalX, petalY;
    
    for (int i=0; i < 360; i = i + 90) {
      petalX = (Cr+petalOffset) * cos(radians(i)) + mouseX;
      petalY = (Cr+petalOffset) * sin(radians(i)) + mouseY;        
      fill(random(0,255), random(0,255), random(0,255));
      ellipse(petalX, petalY, petalR, petalR);
      
    }
  }
}

void mousePressed() {
  // If the user pressed Right mmouse button, save the image
  //if (mouseButton == MIDDLE) {
  //  saveFrame("sgFlowers-####.png");
  //}

  // Clear the screen if middle mouse button is clicked
  if (mouseButton == RIGHT) {
    background(0);
    redraw();
  }
}

