
// Variables 

float posx;
float posy;
PFont fuente;
int indice;
PImage bg;

// constructor

void setup()
{
size(600, 783);
  bg = loadImage ("Adobe-Logo.jpg");

smooth();
fuente = loadFont("StencilStd-48.vlw");
frameRate (2);

   image(bg, 0, 0);
}

// dibujante

void draw()

{
  
//background(200, 0, 0);


String url43 = "http://rssfeeds.tv.adobe.com/digital-design-cs6.xml";

// Objeto que lee la respuesta en XML

XMLElement xml43 = new XMLElement(this,url43);

// Busco los elementos

XMLElement[] xmlTxt = xml43.getChildren("channel/item/title");

// Extraer información

String Title = xmlTxt[indice].getContent();

// movimiento

//fill (random(0, 255), random(0, 255), random(0, 255), random(50, 300));
fill (255, 255, 255, random(0, 500));
textFont (fuente, random(5, 50));
text (Title, posx, posy);

posx = random(0, width/2);
posy = random(0, height);

indice = indice + 1;
  if ( indice >= xmlTxt.length )
  {
  indice = 0;
  }


}

