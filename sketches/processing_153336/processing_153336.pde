
void setup(){
  size(400,400);

  background(55, 22, 66);
  smooth();
  stroke(0,255,0);
  noFill();
}

void draw(){
  
  rect(0,0, width, height);
  noFill();
  ellipse(mouseX,mouseY,0,0); 
  fill( 0, mouseY, mouseX );
 
}
