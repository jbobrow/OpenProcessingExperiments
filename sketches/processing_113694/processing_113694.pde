
//processing practiceE
//by chen,wu-zhi
//

void setup() {
  size(1000, 600);
  smooth();
  strokeWeight(0.5);
}

void draw() {
  //background(250,20);
  float centerX=mouseX/2;
  float centerY=mouseY/2;
  if (mousePressed) {
    stroke(mouseX/4,90);
    strokeWeight(mouseY/5);
    fill(mouseX/2, mouseY/2, mouseX/4+mouseY/4, mouseY/100);
    rect(mouseX,mouseY,mouseX^3,mouseY^3);
  } 
  else {
    strokeWeight(mouseX/100);
    ellipse(random(0.1*mouseX, 2*mouseY), random(0.1*mouseX, 2*mouseY), mouseX*1.5, mouseY*1.5);
    ellipse(mouseX+mouseY, mouseX, mouseX*10, mouseY*10);
    fill(mouseY/2+50, mouseX/2+50, mouseX/4+mouseY/4+50, mouseX/100);
    ellipse(mouseX, mouseY, mouseX/10, mouseY/10);
    stroke(mouseY/2, mouseX/2, mouseX/4+mouseY/4, mouseX/10);
    line(mouseX+50, mouseY+50, mouseX+50, mouseY+50);
    strokeWeight(mouseX/100);
    stroke(mouseY/2, mouseX/2, mouseX/4+mouseY/4, mouseX/100);
    line(mouseY*2, mouseX*2, mouseX, mouseY);
    line(mouseY*2, mouseX*2, mouseX*3, mouseY*3);
    stroke(mouseX/2, mouseX/2, mouseX/2, mouseX/2);
    line(mouseX-100, mouseY-150, random(0.1*mouseX, 2*mouseY), random(0.1*mouseX, 2*mouseY));
  }
}

void keyPressed() {
  saveFrame(" screen-####.png");
}



