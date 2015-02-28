
void setup(){
  size(300,300);
  background(0,255,0);  
  smooth();
}

void draw(){
  noStroke();
  fill(255);
  ellipse(70,70,100,100);
  ellipse(230,70,100,100);
  
  fill(0);
  ellipse(70,70,50,50);
  ellipse(230,70,50,50);
  
  fill(255);
  ellipse(150,300,400,200);
  
  fill(255,0,0);
  rectMode(CENTER);
  rect(150,230,50,60);
}

