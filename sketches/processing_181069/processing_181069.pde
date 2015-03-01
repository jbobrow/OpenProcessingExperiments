
//a varible that can be true/false
boolean mouseDown=false;

void setup() {
  size(400,400);
  background(#08F0FA);
  smooth();
}

void draw() {

  if (mousePressed == true) {
    strokeWeight(map(pmouseX,0,400,1,16));
    stroke(map(pmouseX,0,400,0,256),map(mouseX,0,400,0,256), 256, 256);
    rectMode(CENTER);
    rect(mouseX, mouseY, 100, 100);
    line(pmouseX, pmouseY, mouseX, mouseY) ;
 }

}

void mousePressed() {
  strokeWeight(3);
  noFill();
  ellipse(mouseX,mouseY, 25, 25);
  }

void mouseReleased() {

}


void keyPressed() {
background(225);

}
 


