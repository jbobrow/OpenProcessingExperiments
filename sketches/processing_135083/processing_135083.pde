
float spin = 0.0;
void setup(){
  size(600,600);
  background(43,43,43);
  smooth();
}
  
void draw()
{
  pushMatrix();
  translate(mouseX,mouseY);
  rotate(spin); 
  noStroke();
  fill(random(22,220), random(34,111), random(21,201), random(40));
  triangle(75, -75, 20, 25, 70, 70);
  spin+=.4;   
  popMatrix();
  
}
void keyPressed(){
background(22,34,34);
}
