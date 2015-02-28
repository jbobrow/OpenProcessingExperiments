

int a =50;                                                                    //Se definen las variables
float[]posX = new float [a];
float[]posY = new float [a];
float[]velX = new float [a];
float[]velY = new float [a];
color[]Color = new color[a];
float[]sz = new float[a];


void setup()
{
size(500,500);                                                               //Tamaño de la pantalla
smooth();
for(int i=0; i<a; i++)                                                       //Se inician las variables
  {
    posX[i] = random (width);
    posY[i] = random(height);
    velX[i] = random(1,5);
    velY[i] = random(2,5);
    Color[i] = color(random(0,255),random(0,255),random(0,255)); 
  }
} 


void draw()
{
  smooth();
  background(0);                                                            //Fondo negro
  for (int i = 0; i < 500; i = i+5)                                         //Bucle de lineas
  {
  line(0, i, 500, i);
  }

  for(int i=0; i<a; i++)                                                    //Repetición y actualizacion de las bolas
  {
    posX[i]=posX[i]+velX[i];
    posY[i]=posY[i]+velY[i];
  
    if ((posX[i]<0)||(posX[i]>width))
    {
      velX[i] = -velX[i];
    }
  
    if((posY[i]<0)||(posY[i]>height))
    {
      velY[i]= -velY[i];
    }
  }


  for(int i = 0; i<a; i++)                                                 //Bucle para el color de las bolas
  {
  fill(mouseX+random(0,255),mouseY+random(0,255),random(0,255)); 
  stroke(Color[i]);  
  
  if(sz[i]<255)                                                            
  ellipse(posX[i],posY[i],mouseX,mouseY);   
  }

}



