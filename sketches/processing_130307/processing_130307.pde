
void setup() {
  size(1200, 1000);
  background(0, 0, 0);
  frameRate(60);
 }

void draw() {
  stroke(0,0,0,0);
  fill(random(125,255),50,10,60);
  rect(random(0,575),random(0,1000),random(40),random(40),20);
  stroke(255, 255, 255, 255);
  fill(255, 255, 255, 255);
  ellipse(mouseX, mouseY, 100, 100);
  fill (0, 0, 0, 20);
  rect(0, 0, 600, 1000);
  fill(0,0,0, 3);
  rect(600, 0, 600, 300);
  stroke(255, 255, 255, 255);
  fill(0, 0, 0, 50);
  ellipse(mouseX, mouseY, mouseX/8+30, 100);
  
 }


