
void setup()
{
  size(1000, 800);
  smooth();
  noCursor();
}
 
void draw()
{
 
  float colourRange = map(mouseX, 0, 800, 10, 255);
  background(0);
 
  stroke(colourRange, mouseY, 100);
  strokeWeight(4); 
 
  fill(0);
  ellipse(mouseX-200, mouseY-170, 330, 270); //Orejas
  ellipse(mouseX+200, mouseY-170, 330, 270);
 
 
  ellipse(mouseX, mouseY, 320, 320);//Cabeza
 
 
  arc(mouseX, mouseY, 290, 290, 0.08, 3.06); //Boca
  arc(mouseX, mouseY+10, 290, 20, 0.08, 3.06);
 
  fill(random(255),100,255,50);
  
  ellipse(mouseX-85, mouseY-40, 100, 100); //Ojos
  ellipse(mouseX+85, mouseY-40, 100, 100);
 
}
