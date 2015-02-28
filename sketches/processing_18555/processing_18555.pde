
//Adam Oaks


void setup(){
  size(400,400);
  background(184,210,107);
  smooth();
  frameRate(3000);
}

void draw(){
}

void mouseDragged(){
  fill(0,0,136);
  stroke(255);
  ellipse(mouseX,mouseY,mouseY/3,mouseX/3);
}

