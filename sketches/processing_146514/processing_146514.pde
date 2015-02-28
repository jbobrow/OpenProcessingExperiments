
/*
Taller de Programacion
Arbol de Pitagoras
Manfred Bucher
*/

float inicio, angulo, arbol;
void setup()
{
  size(600, 400);
  inicio = 45;
  noFill();
  smooth();
}
 
void draw()
{
  frameRate(1);
  background(0);
  noStroke();
  fill(100); 
  angulo = radians(45);
  arbol = random(1, 5); 
  translate((width/2)-(inicio/2), height-100);
  rect(0, 0, inicio, inicio);
  noFill();
  recursiveRect(inicio);
}
 // Andres Villalobos
void recursiveRect(float s)
{
  float newSide = s/sqrt(2);
  if (newSide > arbol)
  {
    
    pushMatrix();
    rotate(-angulo);
    stroke((int)random(50, 200), (int)random(100, 200));   
    rect(0, 0, newSide, -newSide);   
    translate(0, -newSide);     
    recursiveRect(newSide);
    popMatrix();
 
    pushMatrix();     
    rotate(angulo);
    translate(0, -newSide);
    stroke((int)random(50, 255), (int)random(100, 200));
    rect(0, 0, newSide, -newSide);
    translate(0, -newSide);
    recursiveRect(newSide);
    popMatrix();
  }
}

