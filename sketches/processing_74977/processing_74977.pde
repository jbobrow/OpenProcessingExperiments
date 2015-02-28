
void setup() {
  size(200, 300);
  smooth();
  background(250, 250, 180);
}

void draw() {

  stroke(60, 0, 140);
  strokeWeight(1);
  line(0, 30, width, 30);
  line(0, 40, width, 40);
  line(0, 50, width, 50);
  line(0, 60, width, 60);
  line(0, 70, width, 70);
  line(0, 80, width, 80);
  line(0, 90, width, 90);
  line(0, 100, width, 100);
  line(0, 110, width, 110);
  line(0, 120, width, 120);
  line(0, 130, width, 130);
  line(0, 140, width, 140);
  line(0, 150, width, 150);
  line(0, 160, width, 160);
  line(0, 170, width, 170);
  line(0, 180, width, 180);
  line(0, 190, width, 190);
  line(0, 200, width, 200);
  line(0, 210, width, 210);
  line(0, 220, width, 220);
  line(0, 230, width, 230);
  line(0, 240, width, 240);
  line(0, 250, width, 250);
  line(0, 260, width, 260);
  line(0, 270, width, 270);
  line(0, 280, width, 280);
  line(30, 0, 30, height);
  line(180, 0, 180, height);
  fill(0);
  ellipse(15, 70, 10, 10);
  ellipse(15, 120, 10, 10);
  ellipse(15, 170, 10, 10);
  ellipse(15, 220, 10, 10);


  stroke(0, 30, 140);
  strokeWeight(2);
  if (mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  if (mousePressed && mouseButton==RIGHT) {
  
  fill(250, 250, 180);
  rect(0, 0, width, 300);
  
  }
}
