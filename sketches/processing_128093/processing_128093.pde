
float angulo = 0.0;
void setup(){
  size(600,600);
  background(43,43,43);
  smooth();
}
 
void draw()
{
  pushMatrix();
  translate(mouseX,mouseY);
  rotate(angulo);  
  noStroke();
  fill(random(255), random(255), random(255), 40);
  triangle(75, -75, 125, 125, 40, 40);
  angulo+=0.4;    
  popMatrix(); 
}
