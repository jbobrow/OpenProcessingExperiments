
// 10/15/11
// ICM
// Ben Light
// bl1236@nyu.edu
// Re-organized code of a previous assignment, Circles 2, using functions and objects
// Circles 2 draws a line of circle starting at max diam, shrinks to min diam in center and returns to max diam again
// mousePressed stops the process, mouseReleased resumes

float a = 0;
float b = 0;

float x = 125;
float radius = 280;

void setup() {
  size(800, 300);
  smooth();
  background(255);
}

void draw() { 
  noFill(); 
  // Set color range based on mouseY or mouse X
  float d = mouseX/3;
  d = constrain(d,0,255);
  float c = mouseY/1.5;

  // Loop sets position X values (x) and radius size (radius)
  x = x + 10;
  if (x < 410) {
    radius = radius - 10;
  }
  if (x > 410) {
    radius = radius + 10;
  }
  if (x > width-140) {
    x = 140;
    radius = 280;
    background(255);
  }
   //drawCircle(x,150,radius,d);  // Draws circles based on mouseY position
   drawCircle(x,150,radius,c);  // Draws circles basd on mouseX position
}

void drawCircle(float posX, float posY, float radCir, float colCir){
  // draws circle based on posX, posY, radCir, and color colCir 
  stroke(colCir);
  ellipse(posX, posY, radCir, radCir);
}


void mousePressed() {
  // Stops Loop
  noLoop();
}

void mouseReleased() {
  // Resumes Loop
  loop();
}

