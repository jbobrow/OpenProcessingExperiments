
void setup() {
  size(200, 200);
  background(255);
}

void draw() {
  background(255);
  rectMode(CENTER);
  stroke(0);
  fill(0, 180, 0);
  rect( mouseX, mouseY, 40, 100); // body
  fill(0, 180, 0);
  ellipse(mouseX, mouseY-30, 60, 60); //head
  fill(0);
  noStroke();
  ellipse(mouseX-19, mouseY-30, 16, 32); //left eye
  ellipse(mouseX+19, mouseY-30, 16, 32); //right eye
  fill(255);
  ellipse(mouseX-20, mouseY-30, 10, 10); //left pupil
  ellipse(mouseX+20, mouseY-30, 10, 10); //right pupil
  stroke(0);
  line(mouseX-20, mouseY+50, mouseX-25, mouseY+70); //left leg
  line(mouseX-25, mouseY+70, mouseX-35, mouseY+70); //left foot
  line(mouseX+20, mouseY+50, mouseX+25, mouseY+70); //right leg
  line(mouseX+25, mouseY+70, mouseX+35, mouseY+70); //right foot
  line(mouseX-20, mouseY, mouseX-50, mouseY+10); //left arm
  line(mouseX+20, mouseY, mouseX-50, mouseY+10); //right arm
  fill(85, 70, 0);
  noStroke();
  triangle(mouseX-50, mouseY+10, mouseX-35, mouseY-90, mouseX-70, mouseY-81); //knuppel
}

