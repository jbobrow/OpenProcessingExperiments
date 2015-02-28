
boolean isDrawing = false;

void setup() {
  
  size(500,500);
  background(255);
  smooth();
  
};

void draw() {
  if (isDrawing) {
    stroke(0,0,0,150);
    line(pmouseX, pmouseY, mouseX, mouseY); //Draws a line from the previous mouse position to the new one.
    stroke(255,0,0,100);
    line(mouseX,mouseY, mouseX + random(0,10) , mouseY + random(0,10)); //draw a line from the mouse to a random point near the mouse
  }
  
};

void mousePressed() {
  isDrawing = !isDrawing;
};



