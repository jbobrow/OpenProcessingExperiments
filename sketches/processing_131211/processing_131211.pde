
void setup() {
  size(800,800);
  background(225);
  stroke(225);
}

void draw(){
  translate(width/2,height/2);
  rotate(TWO_PI/random(5));
  rectMode(CENTER);
  
  fill(150,random(50,100),random(50,150),5);
  ellipse(0,0,random(100,800),random(100,800));
  fill(150,random(50,100),random(50,150),8);
  rect(0,0,random(1,10),random(600));
}
