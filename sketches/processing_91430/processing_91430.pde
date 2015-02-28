

float rotacion;
float posx;
float posy;
XMLElement xmlAscd;
String urlAscd;
int indice;

// -----------------------------------------
// Método setup de la composición
// -----------------------------------------
void setup()
{
  size(600,600);
  background(255);
  smooth();

urlAscd = "http://asociacioncolombianadediseno.wordpress.com/feed/";
xmlAscd = new XMLElement(this,urlAscd);
}

// -----------------------------------------
// Método setup de la composición
// -----------------------------------------
void draw()
{
  // URL de consulta del API de flickr
  indice =indice+1;
int numero = (int)random(7);
String urlAscd = "http://asociacioncolombianadediseno.wordpress.com/feed/";
 XMLElement xmlAscd = new XMLElement(this,urlAscd);

  // Busco los elementos que necesito
  XMLElement[] xmlItems = xmlAscd.getChildren("channel/item");

  // Extraigo la información del elemento que necesito y la dejo en variables

String title= xmlItems[numero].getChild ("title").getContent();

XMLElement[] xmlImagenes = xmlItems[numero].getChildren ("media:content");

String imagen = "";
if(xmlImagenes.length > 1)
imagen= xmlImagenes[1].getString("url");

println (imagen);

  
fill(205,120);
rect(90,70,0,posy);


//translate(posx, posy);
   PImage imagen2= loadImage (imagen);
   if(imagen2 != null)
   image(imagen2,posx,posy,250,250);
   


{
    posx = random(10,width );
posy = random(10,height);

PFont f= loadFont ("Silom-14.vlw");
textFont(f,15);
fill(0);


text(title,0,posy);
noStroke();


 if (posx >=width-200){
     posx=0;


 } 
  if (posy >=height-200){

     posy=0;

 } 
} 
}

