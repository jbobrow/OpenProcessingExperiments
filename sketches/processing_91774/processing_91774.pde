
PImage imgChapulin;
String[] mensajes;
float posx;
int indice;
//int numDichos = 6;  Sin usar archivo

void setup()
{
  size (600, 841);

  imgChapulin = loadImage("fondo.jpg");
  posx = width;
  indice = 0;

  mensajes = loadStrings("chapulin.txt");
}

void draw()
{
  image(imgChapulin, 0, 0, 600, 841);

  fill(0, 0, 0, 150);
  noStroke();
  rect(0, 0, width, 60);

  PFont f = loadFont("Georgia-48.vlw");

  fill(255, 255, 255, 200);
  textFont(f, 25);
  text(mensajes[indice], posx, 40);

  posx = posx -3;

  if ( posx < 0 - textWidth(mensajes[indice]))

  {
    indice = indice +1;
    if (indice >=mensajes.length)
    {
      indice =0;
    }

    posx = width;
  }
}


