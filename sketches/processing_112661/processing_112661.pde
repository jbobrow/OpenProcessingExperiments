
int diameter = 100;

void setup(){
  size(400,400);
  
}

void draw(){
  background(38,120,90);
  diameter = diameter+2;
  println(diameter);
  fill(diameter,mouseY,diameter);
  ellipse(mouseX,200,diameter,diameter);
  
}


