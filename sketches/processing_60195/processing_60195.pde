
void setup() {
  size(500,500);
  background(255);
}
 
void draw() {
  // Es wird eine sich nach Geschwindigkeit verdickende Linie gezeichnet:
  stroke(mouseX,mouseY,random(mouseY),random(180));
  strokeWeight(abs(mouseY-pmouseY));
  line(mouseX,mouseY,mouseX,mouseY);
}


void mousePressed() {
  noStroke();
  fill(mouseX,mouseY,random(mouseX),40);
  ellipse(mouseX,mouseY,100,100);
}
 
void keyPressed() {
  background(random(mouseX));
}

