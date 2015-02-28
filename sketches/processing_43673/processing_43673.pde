
Snake s0;

void setup() {

  smooth();
  size (500, 500);
  //initialise
  s0 = new Snake (50);
  
}

void draw(){
  background(255);
  
  //update the display
  s0.update (mouseX-30,mouseY);
  s0.display();
  
}

