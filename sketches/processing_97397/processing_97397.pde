
//declaraciÛn de variables eje
boolean mousePresionado = false;
int tamano = 30;
int contador = 0;
int indexFigura = 0;
int fillR = 255, fillG = 255, fillB = 255;
int factor = 20;

void setup()

{
   size (400,400);
   frameRate(30);//web fps
}

void draw()
{
  background(0, 0, 0);
  
  if(indexFigura == 0)
  {
    ellipse(mouseX, mouseY, tamano, tamano);
  }
  
  if(indexFigura == 1)
  {
    triangle(mouseX, mouseY, mouseX + factor, mouseY, mouseX + factor/2 , mouseY + factor);
  }
  
  if(indexFigura == 2)
  {
    rect(mouseX, mouseY, tamano, tamano);
  }
  
  fill(fillR,fillG,fillB);
  
  if(mousePresionado == true)
  {
    tamano += 4;
  }
  if(mousePresionado == true && indexFigura == 1)
  {
    factor += 4;
  }
}

void mousePressed()
{
  if(mouseButton == LEFT)
  {
    mousePresionado = !mousePresionado;
    fillG = (int)random(256);
    fillR = (int)random(256);
    fillR = (int)random(256);
  }
  
  if(mouseButton == RIGHT)
  {
    indexFigura = (int)random(3);   
    tamano = 30;
    factor = 20;
  } 
}


