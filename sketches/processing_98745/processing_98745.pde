
void setup(){
  size(250,250);
  smooth();
}

void draw(){
  background(255);
  stroke(0);
  fill(175);
  line(0,0,width,height);
  line(width,0,0,height);
  rectMode(CENTER);
  ellipse(width/2,height/2,width/2,height/2);
  rect(width/8,height/2,width/8,height/8);
  rect(width-width/8,height/2,width/8,height/8);
}


