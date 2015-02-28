
void setup() {
  size(200,200);
  frameRate(30);
  smooth();
}

void draw() {

  fill(255);
  background(255);
  rectMode(CENTER);
  rect(width/2,height/2,width/1.1,height/1.1);
  line(width-(width/1.05),height-(height/1.05),width-(width-(width/1.05)),height-(height-(height/1.05)));
  line(width-(width-(width/1.05)),height-(height/1.05),(width-(width/1.05)),height-(height-(height/1.05)));
  fill(170);
  ellipse(width/2,height/2,width/2.5,height/2.5);
  rect(width/5.5,height/2,width/8,height/8);
  rect(width-(width/5.5),height/2,width/8,height/8);
}


