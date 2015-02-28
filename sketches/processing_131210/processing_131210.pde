
void setup() {
  size(800,800);
  background(225);
  stroke(225);
}

void draw(){
  translate(width/2,height/2);
  rotate(TWO_PI/random(2));
  rectMode(CENTER);
  fill(100,150,random(50,150));
  rect(0,0,random(1,2),random(300));
  fill(70,150,random(100,250));
  rect(0,0,random(1,2),random(700));
  rect(-300,-300,random(1,2),random(500));
  
}
