
//realizado por Nieva Ortega Jair Ivan
void setup(){
size(400,400);}
void draw(){
  background(255);
  smooth();
  noFill();
  stroke(0,0,255);
  strokeWeight(5);
  ellipse(50,50,50,50);
  noFill();
  stroke(255,255,0);
  ellipse(75,75,50,50);
  noFill();
  stroke(0);
  ellipse(105,50,50,50);
  noFill();
  stroke(0,255,0);
  ellipse(130,75,50,50);
  noFill();
  stroke(255,0,0);
  ellipse(mouseX,mouseY,50,50);}

