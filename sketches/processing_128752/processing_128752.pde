
color start=color(0, 0, 0);
color finish;
float amt = 0.0;
void setup() {
  size (400, 400);
  background(250);
}
void draw() {
  stroke(start);
  strokeWeight(5);
  rect(mouseX, mouseY, 20, 60, 20);
  ellipse(mouseX+20, mouseY+60, 20, 20);
  ellipse(mouseX, mouseY+60, 20, 20);
  line(mouseX, mouseY+10, mouseX+20, mouseY+10);
  line(mouseX+10, mouseY, mouseX+10, mouseY+10);

  amt+=.01;
  if (amt >= 1) {
    amt = 0.95;
    start = finish;
    finish = color(random(255), random(255), random(255));
  }
}



