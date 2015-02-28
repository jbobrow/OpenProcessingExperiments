
void setup() {
  size(500,500);
  background(255);
}

void draw() {
  background(255);
  ellipseMode(CENTER);
  stroke(0);
  fill(0);
  ellipse(mouseX, mouseY,100,300);
  fill(128);
  ellipse(mouseX, mouseY -150,100,100);
  fill(255);
  rect(mouseX -25, mouseY -180,20,40);
  rect(mouseX +5, mouseY -180,20,40);
  fill(0);
  rect(mouseX -25, mouseY -130,50,10);
  stroke(0);
  line(mouseX -40, mouseY -185,mouseX -10, mouseY -195);
  line(mouseX +40, mouseY -185,mouseX +10, mouseY -195);
  fill(0);
  rect(mouseX -15, mouseY -150,10,10);
  rect(mouseX +5, mouseY -150,10,10);
  fill(255);
  rect(mouseX -20, mouseY -124,4,4);
  rect(mouseX -15, mouseY -124,4,4);
  rect(mouseX -10, mouseY -124,4,4);
  rect(mouseX -5, mouseY -124,4,4);
  rect(mouseX, mouseY -124,4,4);
  rect(mouseX +5, mouseY -124,4,4);
  rect(mouseX +10, mouseY -124,4,4);
  rect(mouseX +15, mouseY -124,4,4);
  stroke(0);
  line(mouseX -30,mouseY +10, mouseX -50, mouseY +200);
  line(mouseX +30, mouseY +10, mouseX +50, mouseY +200);
  line(mouseX -30, mouseY -90, mouseX -70, mouseY -100);
  line(mouseX +30, mouseY -90, mouseX +70, mouseY -100);
  line(mouseX, mouseY -200, mouseX -10, mouseY -210);
  line(mouseX, mouseY -200, mouseX +10, mouseY -208);
  line(mouseX, mouseY -200, mouseX +3, mouseY -208);
  line(mouseX -120, mouseY -190, mouseX -50, mouseY -70);
  fill(128);
  triangle (mouseX -200,mouseY -150,mouseX -30,mouseY -210,mouseX -130,mouseY -220);
}
