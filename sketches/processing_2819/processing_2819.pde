
//color c1 = color(random(255),random(15),random(30));
color c2 = color(random(30),random(225),random(25));
int i;

void setup(){
  size(400,400);
  smooth();
  frameRate(3);
}

void draw(){
  background(127,40);
  noFill();
  translate(width/(random(20)),height/(random(20)));
  strokeWeight(random(2));
  stroke(c2);
  //rect(random(290),random(180),random(400),random(350));
  for(i=0; i<60; i++){
  quad(random(390),random(180),random(110),random(400),random(400),random(350),random(400),random(250));
  }
  //saveFrame();
}

