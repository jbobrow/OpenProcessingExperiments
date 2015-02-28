
float x=35;//posición
float y=35;
float vx=6;//velocidad
float vy=4;
float diametre=25;
float incremento=15;

// setup inicial
void setup()
{
size(800,600);
}

// ocurre en cada frame
void draw()
{
fill(255, 50);//rellenar de blanco (255) con transparencia (10) el rectangulo
rect(0,0,width, height);//dibujamos un rectángulo para tener control sobre el con "fill"
DibuixaElipse();
ControlVariables();
}

// según la variable, dibuja una ellipse
void DibuixaElipse()
{
ellipse(x,y, diametre,diametre);
ellipse(x,y, diametre/2,diametre/2);
}

// variables de control
void ControlVariables()
{

  if (!keyPressed) // !significa si NO hay una tecla presionada, con esta norma si presionamos una tecla paramos la animación

{
  x=x+vx;
  y=y+vy;
  vy=vy+0.1; //determina la aceleración en Y, cada vez mayor.
  //vx=vx+0.2;
  
      //si la posición en X es mayor que la mitad del diámetro de la ellipse, entonces vx*(-1) = movimiento negativo
      //determina el final de X por la derecha o izquierda y rebota
   
    if ((x>width-diametre/2) || (x<diametre/2)) //los símbolos || significa "o"
      {
       vx=vx*(-1);
       if (diametre<15)
       {
         diametre=diametre+incremento;
       } 
       if (diametre>20)//si el diametro es mayor que 20, definido en 25, súmale el incremento (+15)
       {
         diametre=diametre-incremento;
       } 
      }
      //si la posición en Y es menor que la mitad del diámetro de la ellipse, entonces vy*(-1) = movimiento negativo 
      //determina el final de Y por arriba o abajo y rebota    
 
    if ((y>height-diametre/2) || (y<diametre/2)) //los símbolos || significa "o"
      {
       vy=vy*(-1);
       if (diametre<15)
       {
         diametre=diametre+incremento;
       }
       if (diametre>20)//si el diametro es mayor que 20, definido en 25, súmale el incremento (+15)
       {
         diametre=diametre-incremento;
       }
      }
  }
}

