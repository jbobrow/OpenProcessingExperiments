
float pos = 40;


void setup() {
  size(400, 400);
  noCursor();
  stroke(1,20,129);
}


void draw ()  {
  
  background(200);
  
  fill(mouseX,49,232);
  ellipse(mouseX,mouseY,mouseY/1.5,mouseY/1.5);
  
  fill(196,96,216);
  ellipse(mouseX,mouseY,mouseY/2,mouseY/2);
  
  fill(mouseX,222,255);
  ellipse(mouseX,mouseY,mouseY/3,mouseY/3);
 
  fill(mouseY,187,241);
  ellipse(mouseX,mouseY-pos,mouseX/5,mouseX/5);
  ellipse(mouseX-pos,mouseY,mouseX/5,mouseX/5);
  ellipse(mouseX+pos,mouseY,mouseX/5,mouseX/5);
  ellipse(mouseX,mouseY+pos,mouseX/5,mouseX/5);
 
  fill(mouseX,5,126);
  ellipse(mouseX,mouseY-pos,mouseX/8,mouseX/8);
  ellipse(mouseX-pos,mouseY,mouseX/8,mouseX/8);
  ellipse(mouseX+pos,mouseY,mouseX/8,mouseX/8);
  ellipse(mouseX,mouseY+pos,mouseX/8,mouseX/8);
  
}
