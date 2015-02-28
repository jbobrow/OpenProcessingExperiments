
void setup(){
  size(700,350);
  background(255);
}
void draw(){
  println("x:  " + mouseX + " y: " + mouseY);
  fill(0);
  triangle(140,60,100,115,170,120);
  fill(255,0,0);
  noStroke();
  ellipse(219,89,60,60);
  fill(0);
  quad(246,106,293,92,283,195,236,176);
  fill(255,0,0);
  noStroke();
  quad(288,152,362,125,388,180,310,205);
  fill(103);
  noStroke();
  quad(487,152,530,155,520,235,477,228);
  stroke(0);
  strokeWeight(2);
  noFill();
  arc(218,123,150,150,radians(90),radians(180));
  line(473,64,581,80);
}
