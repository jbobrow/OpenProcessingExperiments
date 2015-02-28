
//processing practiceE
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
    fill(mouseY/2, mouseX/2, mouseX/4+mouseY/4, mouseX/10);
  } 
  else {
    ellipse(random(0.5*mouseX, 2*mouseX), random(0.5*mouseX, 2*mouseX), mouseX*2, mouseY*2);
    ellipse(mouseX+mouseY, mouseX, mouseX*10, mouseY*10);
    fill(mouseY/2+50, mouseX/2+50, mouseX/4+mouseY/4+50, mouseX/10);
    ellipse(mouseX, mouseY, mouseX/10, mouseY/10);
    stroke(mouseY/2, mouseX/2, mouseX/4+mouseY/4, mouseX/10);
    line(mouseX+50, mouseY+50, mouseX+50, mouseY+50);
    strokeWeight(mouseX/100);
    stroke(mouseY/2, mouseX/2, mouseX/4+mouseY/4, mouseX/100);
    line(mouseY*2, mouseX*2, mouseX, mouseY);
    line(mouseY*2, mouseX*2, mouseX*3, mouseY*3);
    stroke(mouseX/2, mouseX/2, mouseX/2, mouseX/2);
    line(mouseX-50, mouseY-50, random(0.5*mouseX, 2*mouseX), random(0.5*mouseX, 2*mouseX));
  }
}

void keyPressed() {
  saveFrame(" screen-####.png");
}



