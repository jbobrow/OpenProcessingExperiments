
float rotacion;
float posx;
float posy;
//XMLElement xmlFlickr;
String tags;
int i;
int j;
int alto;
int ancho;
// -----------------------------------------
// Método setup de la composición
// -----------------------------------------
void setup()
{
  size(600,600);
  background(255);
  smooth();
  //tags = bogota;
  posx =0;
  posy =0;
  i =0;
  j =0;
  alto=80;
  ancho=80;
}

// -----------------------------------------
// Método setup de la composición
// -----------------------------------------
void draw()
{
  // URL de consulta del API de flickrç
 
  //background(255);
  String urlyahooWeather = "http://weather.yahooapis.com/forecastrss?w=368148&u=c";

  // Objeto que lee la respuesta en XML
  
  
  XMLElement xmlyahooWeather = new XMLElement(this,urlyahooWeather);

  // Busco los elementos que necesito

  
  XMLElement[] xmlClima = xmlyahooWeather.getChildren("channel/item/yweather:condition");
  
  String clima = xmlClima[0].getString("temp");

  // Extraigo la información del elemento que necesito y la dejo en variables
  
  
 
  String urlFlickr = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=876101b55da8f4d2a216de2f804e6599&tags=bogota&per_page=50&format=rest&";
  //"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=876101b55da8f4d2a216de2f804e6599&tags="+tag+"&format=rest";
  
  XMLElement xmlFlickr = new XMLElement(this,urlFlickr);
  
  XMLElement[] xmlImagenes = xmlFlickr.getChildren("photos/photo");
  
 
  /*while (j < xmlImagenes.length);
  
  while (i < xmlImagenes.length);
  */ 
  
  String farmId = xmlImagenes[i].getString("farm");
  String serverId = xmlImagenes[i].getString("server");
  String secret = xmlImagenes[i].getString("secret");
  String photoId = xmlImagenes[i].getString("id");
  String titulo = xmlImagenes[i].getString("title");
 
 i=i+1;

  // Construyo la URL para descargar la imagen
  String urlImagen = "http://farm"+farmId+".staticflickr.com/"+serverId+"/"+photoId+"_"+secret+".jpg";

  // Descargo la imagen de flickr según la url
  PImage imagen = loadImage(urlImagen);

  // Variables para describir el movimiento de las imágenes.
  rotacion = random(1);
 // posx = random(200, width-200);
 // posy = random(200, height-200);

  // Pinto la imagen dando el efecto de desorden y superposición entre ellas
  
 image(imagen,posx,posy,ancho,alto);
 
  textSize(100);
 fill(255,230,150);
 text(clima+"º",250,300);
 posx = posx+ancho;
 if(posx >=width)
 {
 posx = 0;
posy = posy +alto; 
 }
if(posy >=height)
posy=0;

}

