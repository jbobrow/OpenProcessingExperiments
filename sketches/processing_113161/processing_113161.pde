
//processing practiceD
//by chen,wu-zhi
//

void setup() {
  size(500, 500);
  smooth();
  strokeWeight(0.5);
}

void draw() {
  //background(250,20);
  float centerX=mouseX/2;
  float centerY=mouseY/2;
  if (mousePressed) {
    fill(150, 40, 105, 30);
  } 
  else {
    fill(255, 150, 4, 30);
  }
  ellipse(mouseY, mouseX, 40, 80);
  ellipse(mouseX, mouseY, 40, 40);
  stroke(150, 0, 100, 50);
  line(mouseY, mouseX, 250, 250);
  stroke(150, 100, 200, 50);
  line(mouseX, mouseY, 0, 250);
  stroke(250, 50, 50, 50);
  line(mouseX, mouseY, 250, 0);
  stroke(100, 30, 90, 50);
  line(mouseY, mouseX, 250, 250);
  line(mouseX, mouseY, 125,250);
}

void keyPressed() {
  saveFrame(" screen-####.png");
}



