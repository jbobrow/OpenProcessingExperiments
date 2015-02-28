
int q = 500;

void setup(){
  
  size(500,500);
  background(0);
  
}

void draw(){
  
  stroke(0);
  fill(153,38,188,40);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,60,60);
  ellipse(mouseX,pmouseY,60,60);
}

