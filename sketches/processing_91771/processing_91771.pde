
String texto;
String texto1;
String texto2;
PFont fuente;
PImage fondo;
int posx;
int posy;
int velocidad;

void setup()
{
  size(1000, 486);
  fuente = loadFont("AmericanTypewriter-Light-48.vlw");
  fondo = loadImage("beach.jpg");
  texto1 = "Colombia es playa, brisa y mar.";
  texto2 = "Colombia is beach, wind and sea.";
  texto = texto1;
  posx = width;
  posy = 50;
  velocidad = -5;
}

void draw()
{
  image(fondo, 0, 0);
  textFont(fuente, 36);
  //fill(#FFFFFF);
  fill(#F2F7D7);
  text(texto, posx, posy);
  posx=posx+velocidad;
  println(posx+","+posy); 

  while (posx < (0-textWidth (texto)))
  {
    if (texto==texto1)
    { 
      texto=texto2;
      posx= width;
    }
    else
    { 
      texto=texto1;
      posx= width;
    }
  }
}


