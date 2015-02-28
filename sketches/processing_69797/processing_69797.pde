
void setup()
{
  size(300,200);
  noFill();
  smooth();
  strokeWeight(5);
  background(255);
}

void draw()
{
  background(255);
  //Azul 
  stroke(0,0,255);
  ellipse(100,90,70,70);
  //Negro
  stroke(0);
  ellipse(160,90,70,70);
  //Amarillo
  stroke(255,255,0);
  ellipse(130,140,70,70);
  //Verde
  stroke(0,255,0);
  ellipse(190,140,70,70);
  //Rojo
  stroke(255,0,0);
  ellipse(mouseX+10,mouseY+10,70,70);
  stroke(0);
  }

