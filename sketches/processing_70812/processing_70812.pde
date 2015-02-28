
void setup(){
  size(400,400);
  background(0,0,0);
}

void draw(){
  ellipse(mouseX,mouseY,1+random(100),1+random(100));
  fill(1+random(255),1+random(255),1+random(255));
}

void mousePressed(){
  fill(1+random(255),1+random(255),1+random(255));
  background(1+random(255),1+random(255),1+random(255));
}

