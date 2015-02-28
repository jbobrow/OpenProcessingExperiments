
//declaraciÛn de variables eje
boolean mousePresionado = false;
int tamano = 30;
int contador = 0;

int fillR = 255, fillG = 255, fillB = 255;

void setup()

{
   size (400,400);
   frameRate(30);//web fps
}

void draw()
{
  background(0, 0, 0);
  
  ellipse(mouseX, mouseY, tamano, tamano);
  fill(fillR,fillG,fillB);
  if(mousePresionado == true)
  {
    tamano += 4;
  }
}

void mouseClicked()
{
  mousePresionado = !mousePresionado;
  fillG = (int)random(256);
  fillR = (int)random(256);
  fillR = (int)random(256);
}


