
int diameter = 100;

void setup(){
  size(400,400);
  
}

void draw(){
  background(227, 209, 185);
  noStroke();
  diameter = diameter+2;
  
  
  
  fill(diameter,mouseY,diameter);
  ellipse(width/2,height/2,diameter,diameter);
  println(diameter);
  
}


