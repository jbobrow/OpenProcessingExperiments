
float mida = 40;

 
void setup() {
  size(300, 300);
}
 
void draw ()  {
   
  background(100,mouseX,mouseY);
  stroke(0,0,0);
  strokeWeight(0.05*mouseY);
   
 
   
  fill(mouseX,222,255);
  ellipse(mouseX,mouseY,mouseY,mouseY);
  
  fill(10,mouseX,mouseY);
  ellipse(mouseX,mouseY,mouseY/1.5,mouseY/1.5);
  
  fill(mouseX,49,mouseY);
  ellipse(mouseX+mida,mouseY+mida,mouseY/5,mouseY/5);
  
  fill(mouseX,49,mouseY);
  ellipse(mouseX-mida,mouseY-mida,mouseY/5,mouseY/5);
  
  fill(mouseX,49,mouseY);
  ellipse(mouseX-mida,mouseY+mida,mouseY/5,mouseY/5);
  
  fill(mouseX,49,mouseY);
  ellipse(mouseX+mida,mouseY-mida,mouseY/5,mouseY/5);
  
  fill(mouseX,49,mouseY);
  ellipse(-mouseX+mida,-mouseY+mida,-mouseY/5,-mouseY/5);
  
}
