
void setup(){
  size(400,400);
  noStroke();
  rectMode(CENTER);
  noCursor();
}

void draw(){
  float q = random(255);
  float r = random(10);
  String p = "suit";
  String k = "tie";
  background(0);
  triangle(0,30,0,370,mouseX,200);
  triangle(400,30,400,370,mouseX,200);
  textSize(40);
  fill(100);
  text("&",mouseX,mouseY);
  fill(255,q);
  ellipse(mouseX,200,q,q);
  fill(255);
  textAlign(CENTER);
  textSize((mouseY/2)-r/*(mouseX/2)*/);
  text(k,mouseX,mouseY+(mouseY/2));
  text(p,mouseX,mouseY-(mouseY/2.5));
}
