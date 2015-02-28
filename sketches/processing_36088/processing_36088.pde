

/*
  this is a realy simple mouse sketch/interaction 
  ellipses are drawn based where at the mouse pointer

*/
void setup() {
  size(800,400);
  background(255);
  noFill();
}

int x=400,y=400;

void draw() {
  
  
  ellipse(mouseX+random(10),mouseY+random(10),10,10);
}


