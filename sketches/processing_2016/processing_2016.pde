
//This is the setup wrapper. Anything in here happens once at the start of our program.
boolean isDrawing = false;

void setup() {
  
  size(500,500); //set the size of the window.
  background(#b9d7f9); //set the background colour
  smooth();//turn on smoothing
  stroke(4,58,68,150);
  fill(5,140,240,5);
  
  
};

//This is the draw wrapper. Anything in here happens once per frame.
void draw() {
  if (isDrawing) {
  
  line(250,250, mouseX + random(10), mouseY +random(10));
  ellipse(250,250,mouseX + random (2), mouseY + random(2));
  }
};

void mousePressed() {
  isDrawing = !isDrawing;
};

