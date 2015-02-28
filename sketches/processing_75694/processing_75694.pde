
//Torres Torres Felipe Andres
//Hernandez Cruz Yanahui

PImage foto;
int posx;
int posy;

void setup()
{
  posx = -400;
  posy = -400;
  size(400,400);
  foto = loadImage("lena.jpg");
}

void draw()
{
  background(0);
  image(foto,posx,posy);//desplegamos la imagen en la posicion 0,0
  posx++;
  posy++;
  
  if((posx) >= 0)
  {
    noLoop();
  }
}



