
void setup(){
  size(500,500);
  smooth();
  background(255);
}

void draw(){
  for (int i=1;i<70;i+=5){
  myFunction(i,i);
}
  
}

void myFunction (int circw, int circh){
  noFill();
  stroke(random(255),mouseY,mouseX);
  ellipse(mouseX, mouseY, circw,circh);
}



