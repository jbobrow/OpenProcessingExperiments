



void setup() {
  size(400,400);
  background(255);
  smooth();
}

void draw() {
  if (mousePressed==true){
  strokeWeight(map(pmouseX,0,400,1,6));
  stroke(map(pmouseY,0,400,0,220));
  rect(pmouseX, pmouseY, mouseX, mouseY);
  }

}

//do this when mouse is pressed

void mousePressed() {
strokeWeight(7);
stroke(225,0,25);
ellipse(mouseX, mouseY, 50, 50);
}

void mouseReleased() {
strokeWeight(20);
stroke(225,0,25);
noFill();
ellipse(mouseX, mouseY, 100, 100);
}

//do this when key is pressed

void keyPressed(){
  background(255);
}


