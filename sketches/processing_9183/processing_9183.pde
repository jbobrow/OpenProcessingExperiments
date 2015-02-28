
void setup () {
  size(500,500);
  frameRate (1);
}


void draw () {
  //background(255);
  //println(mouseX + "," + mouseY);
  //ellipse(mouseX, mouseY, 10, 10);
  stroke(mouseX, mouseY, 0);
  //strokeWeight(abs(mouseX-pmouseY));
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void mousePressed () {
  println("pressed mousey");
  fill(255,0,0,125);
  rect(mouseX, mouseY, 10, 10);
  noFill();
}

void mouseMoved() {
  println("mouse dragged");
  //background(255);
  fill(0,255,0,125);
  ellipse(mouseX, mouseY, 10, 10);
  noFill();
}

