
color c1 = color(random(255),random(15),random(30));


void setup(){
  size(500,500);
  background(0,127);
  smooth();
  //noFill();
  frameRate(20);
}

void draw(){
  strokeWeight(random(20));
  stroke(c1);
  rect(random(290),random(180),random(400),random(350));
  saveFrame();

}

