
void setup() {
  size(250,250);
}

void draw() {
 
  background(255);

  // Body
  stroke(0);
  fill(175);
  rectMode(CENTER);
  
  // mouseX is a keyword that the sketch replaces with the horizontal position of the mouse.
  // mouseY is a keyword that the sketch replaces with the vertical position of the mouse.
  rect(mouseX,mouseY,50,50);   
}



