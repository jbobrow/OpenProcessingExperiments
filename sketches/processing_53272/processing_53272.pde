
//homework 8 rwandrew
//copyright russell andrews 2012

void setup(){
  size(400, 400);
  background(255);
  smooth();
}

void draw(){
  whileStuff();
  
}


void whileStuff(){
  float x=0;
  
  while(x <= width){
  noStroke();
  fill(x, 240+x, 0, 2);
  ellipse(width/2, height/2, x, x);
  x=x+20;
}
}

