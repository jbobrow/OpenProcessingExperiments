
void setup(){
  size(500,500);
  smooth();
  background(255);
}

void draw(){
  myFunction(60); //circle01
  myFunction(30); //circle 02
  myFunction(10); //circle03
}

void myFunction (int diameter){
  fill(random(255),mouseY,mouseX);
  ellipse(mouseX, mouseY, diameter,diameter);
}


