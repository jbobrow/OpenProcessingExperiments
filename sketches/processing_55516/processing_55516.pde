
/* Source: http://www.openprocessing.org/sketch/51216, code was modified to meet my own needs */

void setup() {
  size(800,800);
  background(255);
}
 


 
void draw() {
  smooth();
  fill(200,100,300);
  strokeWeight(10);
  stroke(mouseX/2,mouseY/2,50,100);
  /* the size of the rectangles are reliant on the x and y values of mouse*/
  rect(mouseX,mouseY,mouseY,mouseX);
alpha (0);




}


/* mouseReleased tag allows for the user to begin the sketch over again by clearing everything that was drawn*/

void mouseReleased () {
  background (255);
}

