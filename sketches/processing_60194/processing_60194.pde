
void setup() {
  size(500,500);
  background(255);
  println("setup");
}
 
void draw() {
  // Es wird eine sich nach Geschwindigkeit verdickende Linie gezeichnet:
  stroke(mouseX,mouseY,mouseY,180);
  strokeWeight(abs(mouseX-pmouseX));
  line(mouseX,mouseY,pmouseX,pmouseY);
}
 
/*void draw() {
  // Es wird eine 5 px dicke rote Linie gezeichnet:
  stroke(255,0,0,120);
  strokeWeight(5);
  line(mouseX,mouseY,pmouseX,pmouseY);
}*/
 
//Beim Klicken entsteht ein Rechteck:
/*void mousePressed() {
  noStroke();
  fill(mouseX,mouseY);
  ellipse(mouseX,mouseY,100,100);
}*/
 
void keyPressed() {
  background(255);
}

