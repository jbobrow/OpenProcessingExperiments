
int bestnumber = 23;
float percent = 100;

void setup() {
  size(600, 600);
  background(150);
}

void draw() {
  

  noFill();
  
  stroke(46, 46, 46);
  ellipse(mouseX, 0, 200, 200);
  ellipse(0, mouseY, 200, 200);
  ellipse(mouseY, 600, 200, 200);
  ellipse(600, mouseX, 200, 200);
  ellipse(mouseX, 300, 200, 200);
  ellipse(300, mouseX, 200, 200);
  ellipse(mouseY, 300, 200, 200);
  ellipse(300, mouseY, 200, 200);


  
  stroke(0, 255, 255);
  line(mouseX, mouseY, 0, 0);
  stroke(255, 0, 255);
  line(mouseX, mouseY, 600, 600);
  stroke(255, 255, 0);
  line(mouseX, mouseY, 600, 0);
  stroke(255, 255, 255);
  line(mouseX, mouseY, 0, 600);
  
  fill(mouseX / 2, mouseY / 2, 127 - mouseX + mouseY);
  rect(mouseX - 25, mouseY - 25, 50, 50);
}

