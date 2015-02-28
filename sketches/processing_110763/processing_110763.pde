
void setup(){
  size(500, 500);
  background(255, 255, 255);
}

void draw(){
}

void mouseClicked() {
  // body
  noStroke();
  fill(164, 199, 57);
  rect(mouseX-50, mouseY-50, 100, 100, 0, 0, 15, 15);
  // head
  fill(164, 199, 57);
  arc(mouseX, mouseY-55, 100, 80, PI, 2*PI, OPEN);
  // antenna
  stroke(164, 199, 57);
  strokeWeight(5);
  line(mouseX-40, mouseY-110, mouseX-30, mouseY-88);
  line(mouseX+40, mouseY-110, mouseX+30, mouseY-88);
  // arms
  strokeWeight(20);
  line(mouseX-65, mouseY-42, mouseX-65, mouseY);
  line(mouseX+65, mouseY-42, mouseX+65, mouseY);  
  // legs
  line(mouseX-20, mouseY+40, mouseX-20, mouseY+75);
  line(mouseX+20, mouseY+40, mouseX+20, mouseY+75);
  // eyes
  noStroke();
  fill(255, 255, 255);
  ellipse(mouseX-23, mouseY-70, 8, 8);
  ellipse(mouseX+23, mouseY-70, 8, 8);
}
