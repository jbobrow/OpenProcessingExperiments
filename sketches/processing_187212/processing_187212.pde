
boolean content = true;
void setup() {
  size(300,300);
  background(#5166A0);
}
void draw() {
  println(mouseX + ":" + mouseY);
  noFill();
  strokeWeight(5);
  if (content){
    arc(150,150,80,80,0,PI);
    arc(112,90,20,20,PI+0.7,TWO_PI-0.7);
    arc(185,90,20,20,PI+0.7,TWO_PI-0.7);
  }
  else {
    line(118,166,179,166);
    line(102,85,122,85);
    line(175,85,195,85);
  }
  ellipse(112,106,20,20);
  point(112,106);
  ellipse(185,106,20,20);
  point(185,106);
}
void mousePressed() {
  content=!content;
  background(#5166A0);
}


