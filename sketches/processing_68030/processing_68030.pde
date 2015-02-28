
//El aro rojo se mueve con el mouse.
void setup()
 {
  size(350,200);
  smooth();
  noFill();
  strokeWeight(3);
 }
void draw()
 {
  background(255);
  stroke(0,0,255);//Azul.
  ellipse(120,90,70,70);

  stroke(255,255,0);//Amarillo.
  ellipse(145,120,70,70);

  stroke(0);//Negro
  ellipse(175,90,70,70);

  stroke(0,255,0);//Verde.
  ellipse(200,120,70,70);

  stroke(255,0,0);//Rojo.
  ellipse(mouseX,mouseY,70,70);
 }
