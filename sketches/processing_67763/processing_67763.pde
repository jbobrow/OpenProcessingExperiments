
void setup()
{
  size(600,400);
}
void draw()
{
  background(255);
  strokeWeight(4);
  noFill();
  smooth();
  //Aro rojo
  stroke(255,0,0);
  ellipse(mouseX,mouseY,125,125);
  //Aro Negro
  stroke(0,0,0);
  ellipse(187,120,125,125);
  //Aro azul
  stroke(0,0,255);
  ellipse(75,120,125,125);
  //Aro amarillo
  stroke(255,255,0);
  ellipse(130,216,125,125);
  //Aro verde
  stroke(0,255,0);
  ellipse(245,215,125,125);
}

