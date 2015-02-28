
//20131002mouse interaction
//juichilin
//class 

void setup() {
  size(480, 120);
  smooth();
}

void draw() {
  if (mousePressed) {
    fill(0);
  }
  else {
    fill(30, 60, 90, 90);
    stroke(255);
  }
  rect(mouseX, mouseY, 40, 60);
  line(mouseX,mouseY,mouseX+10,mouseY+10);
  line(mouseX+40,mouseY+60,mouseX+30,mouseY+50);
  line(mouseX+40,mouseY,mouseX+30,mouseY+10);
  line(mouseX,mouseY+60,mouseX+10,mouseY+50);
  
  rect(mouseX+10,mouseY+10,20,40);
  
}



