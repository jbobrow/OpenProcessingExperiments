
float x=0;//posición
float y=0;
float vx=5;//velocidad
float vy=1;
float diametre=25;

void setup()
{
size(800,600);
background(255);
}

void draw()
{
background(255);
ellipse(x,y, diametre,diametre);

if (keyPressed) // !significa si NO hay una tecla apretada

{
  x=x+vx;
  y=y+vy;
      //si la X es mayor que el tamaño de la ellipse, entonces vx*(-1) = conviértela en negativa
    if (x>width)
      {
       vx=vx*(-1); 
      }
}

}
