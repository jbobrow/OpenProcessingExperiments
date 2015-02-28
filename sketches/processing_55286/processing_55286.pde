
//* inspired by Rainbow Vortex by Lindsey Baker 
//*http://www.openprocessing.org/visuals/?visualID=51216

// drawn once
void setup() {
  size(500,500);
  background(255);
  smooth  ();
}

// lines that are redrawn and follow mouse movement
void draw() {
  stroke(mouseX/5,mouseY/5,50,50);
  strokeWeight (2);
  line (mouseX,mouseY,mouseY,height/2);
}

//mouse behaviours
void mousePressed() {
  background (mouseX/5,mouseY/5,50,50);
}

void mouseReleased() {
  background (255);
} 


 


