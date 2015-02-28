

 
int puntos=0;                                           //Número de puntos con los que empiezas
int vidas=5;                                            //Número de vidas con las que empiezas
boolean perder=false;                                   //Definimos la variable perder en falso
int posX,posY;                                          //Posiciones en los ejes de la bola
int vX,vY;                                              //Velocidades de la bola
 
void setup()                                             //Inicialización
 
{
  size(400,550);            
  smooth();
  posX=width/2;
  posY=height/2;
  vX=1;
  vY=1;
}

 
void draw()

{ 
 background(0);                                        //Fondo negro
 ellipse (posX,posY,50,50);                            //Dibujo de la bola

 text("PUNTOS = "+puntos,10,10);                       //Se escriben los textos de vida y puntos
 text("VIDAS = "+vidas,width-80,10);            
    if (vidas<=0)                                      //Comprueba si has perdido
      {
      textSize(20);
      text("CLICK PARA EMPEZAR", 100,100);             //Si has perdido te aparece el texto
      noLoop();                                        //Deja de repetir la función draw
      perder=true;
      textSize(13);                
      }
                                                       //Desplazamiento de la bola
 posX=posX+vX;
 posY=posY+vY;
                                                       //La bola rebota en las paredes de la pantalla  
if(posX-25<0||posX+25>width)
  {
    vX=-vX;
  }

if(posY-25<0||posY+25>height)
  {
    vY=-vY;
  }
}
 
 
void mousePressed()                                   //Función que ocurre cuando pulsas el ratón

{
  if (dist(mouseX, mouseY, posX, posY)<=25)           //Comprueba si has hecho click dentro de la bola
  {
    puntos=puntos+1;                                  //Aumentan los puntos
    vX=vX*2;                                          //Aumenta la velocidad de la bola
    vY=vY*2; 
 fill(random (0,255),random (0,255), random (0,255)); //Cambia el color de la bola y los textos de manera aleatoria
    textSize(13);
}
  else                                           
  {
    vidas=vidas-1;                                    //Te resta una vida si no clickas dentro de la bola
  }
  
  if (perder==true)                                   //Si te quedas sin vidas
    {
      vX=2;                                           //Resetear los valores
      vY=2;
      vidas=5;
      puntos=0;
      posX=width/2;
      posY=width/2;
      perder=false;
      loop();                                        //Loop de la función para que se repita
    }
}



