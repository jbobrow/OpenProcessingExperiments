
// Elizabeth García Maya
//Grupo: 1904
// ACTIVIDAD 2
void setup()
{
  size(600,400);

}
void draw()
{
  background(255);
  smooth();
  noFill(); //para que no que loque fondo
  strokeWeight(5);
  stroke(0,0,255);//AZUL
  ellipse(250,200,60,60);
  stroke(255,255,0);//AMARILLO
  ellipse(280,240,60,60);
  stroke(0,0,0);//NEGRO
  ellipse(300,200,60,60);
  stroke(0,255,0);//VERDE
  ellipse(330,240,60,60);
  stroke(255,0,0); //ROJO
  ellipse(mouseX,mouseY,60,60);
}
