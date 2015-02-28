
void setup(){
  size(500,500);
  
}

void draw(){
  background(189,240,252);
  poke();
  noCursor();
}
void poke(){
  stroke(157,6,6);
  strokeWeight(4);
  fill(0);
  ellipse(mouseX,mouseY,200,200);
   fill(255);
 ellipse(mouseX,mouseY,180,180);
  fill(255,0,0);
  arc(mouseX, mouseY, 180, 180, 0, PI, OPEN);
  fill(0);
  rect(mouseX-90,mouseY-5,180,10);
  ellipse(mouseX,mouseY,40,40);
  fill(255);
  ellipse(mouseX,mouseY,20,20);

  
}


