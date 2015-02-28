
//Candice Ferreira. Problem 1 Question 6
//evokes symmetry
void setup() {
  size(600, 600);
  smooth ();
 }
void draw() {
  fill(20, 80, 256);
  rect (height-mouseX, width-mouseY, (mouseX+mouseY)*-0.3,(mouseX+mouseY)*-0.3);
  fill(100, 10, 160);
  rect (mouseX+7.0,mouseY-7.0,(mouseX+mouseY)*0.4,(mouseX+mouseY)*0.4);
  
 }

