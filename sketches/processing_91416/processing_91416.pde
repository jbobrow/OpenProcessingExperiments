

float rotacion;
float posx;
float posy;
XMLElement xmlClima;
String urlClima;
int indice;
// -----------------------------------------
// Método setup de la composición
// -----------------------------------------
void setup()
{
  size(600,600);
  background(255);
  smooth();

urlClima = "http://weather.yahooapis.com/forecastrss?w=368148&u=c";
xmlClima = new XMLElement(this,urlClima);
}

// -----------------------------------------
// Método setup de la composición
// -----------------------------------------
void draw()
{
  // URL de consulta del API de flickr
  indice =indice+1;

String urlFlickr = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=083c17d5ae63f536739f9493a1432d4c&tags=Bogot%C3%A1&format=rest";
 XMLElement xmlFlickr = new XMLElement(this,urlFlickr);

  // Busco los elementos que necesito
  XMLElement[] xmlImagenes = xmlFlickr.getChildren("photos/photo");

  // Extraigo la información del elemento que necesito y la dejo en variables
  String farmId = xmlImagenes[indice].getString("farm");
  String serverId = xmlImagenes[indice].getString("server");
  String secret = xmlImagenes[indice].getString("secret");
  String photoId = xmlImagenes[indice].getString("id");
  String titulo = xmlImagenes[indice].getString("title");

  // Construyo la URL para descargar la imagen
  String urlImagen = "http://farm"+farmId+".staticflickr.com/"+serverId+"/"+photoId+"_"+secret+".jpg";

  // Descargo la imagen de flickr según la url
  PImage imagen = loadImage(urlImagen);
  
    //posx = random(0,600 );
  //posy = random(200, height-200);


//translate(posx, posy);
   image(imagen,posx,posy,50,50);
   
   

 // Objeto que lee la respuesta en XML
  XMLElement xmlClima = new XMLElement(this,urlClima);

  // Busco los elementos que necesito
  XMLElement[] bolsaxmlTemperatura = xmlClima.getChildren("channel/item/yweather:condition");

  // Extraigo la información del elemento que necesito y la dejo en variables
  
  String temperatura = bolsaxmlTemperatura [0].getString("temp");

fill(255);
rect(90,70,50,40);

PFont f= loadFont ("Serif-48.vlw");
textFont(f,25);
fill(0);
text(temperatura,100,100);

   posx+=50;
   if (posx >=width){
     posx=0;
     posy+=50;
  
 }
   
}

