
void setup () {
  size(500,500);
}


void draw () {
  //background(255);
  //println(mouseX + "," + mouseY);
  //ellipse(mouseX, mouseY, 10, 10);
  stroke(mouseX, mouseY, 0);
  strokeWeight(abs(pmouseX+mouseY));
  line(pmouseX, pmouseY, mouseX, mouseY);
}

