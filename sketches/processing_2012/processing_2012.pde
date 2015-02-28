
boolean isDrawing = false;

void setup (){
  size (500, 500);
  background (#CCFFFF);
  smooth ();
};

void draw(){
  if (isDrawing) {
    noStroke ();
    
    fill (random (300, 200), random (300, 10), random (10,10), 55);
    rect (mouseX, mouseY, random (20,20), random (20,20) );
    
    fill (random (280, 10), random (200, 10), random (10,10), 55);
    stroke (#FFFFFF);
    ellipse (mouseX, mouseY, 15, 15);
    
    
  }
  
};

void mousePressed() {
  isDrawing = !isDrawing;
  
};

