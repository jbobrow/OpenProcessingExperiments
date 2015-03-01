
// a variable that can be true/false
boolean mouseDown = false;

void setup() {
  size(400,400);
  background(255);
  smooth();
}

void draw() {
  
  if (mousePressed == true) {
    strokeWeight(map(pmouseX,0,400,1,16));
    //stroke(R,G,B,Alpha or opacity);
    stroke(map(mouseY,0,400,0,256), map(mouseY,0,400,0,256), 196, 190);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }

}

//do this when the mouse is pressed
void mousePressed() {
  strokeWeight(3);
  noFill();
  stroke(225,0 ,25);
  ellipse(mouseX, mouseY, 25, 25);
}

void mouseReleased() {
  strokeWeight(3);
  noFill();
  stroke(225,0 ,25);
  ellipse(mouseX, mouseY, 25, 25);
}

//do this when the key is pressed
void keyPressed(){
  background(255);
  
}


