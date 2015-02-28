
float x=25;//posición
float y=25;
float vx=1;//velocidad
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
  vy=vy+0.1; //determina la aceleración en Y, cada vez mayor.
  
      //si la X es mayor que la mitad del diametro de la ellipse,entonces vx*(-1) = conviértela en negativa
    if (x>width-diametre/2)
      {
       vx=vx*(-1); 
      }
    if (x<0)
      {
        vx=vx*(-1);
      }
    if (y<height-diametre/2)
      {
       vy=vy*(-1);
      }
    if (y>0)
      {
       vy=vy*(-1);
      }
  }
}
