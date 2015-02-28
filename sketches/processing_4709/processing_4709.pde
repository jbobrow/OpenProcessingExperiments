
int x, y, r;

void setup(){
  size(800,600);
  rectMode(CENTER);
}

void draw(){
  fill(0,0,255);
  background(255);
  
  pushMatrix();
  scale(3);
  translate(100,100);
  rotate(1.7);
  
  //rect(0,0,50,50);
  popMatrix();
  
  pushMatrix();
  translate(400,400);
  rotate(2.7);
  
  
  rect(0,0,50,50);
  popMatrix();
}


