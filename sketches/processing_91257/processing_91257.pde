

float rotacion;
float posx;
float posy;
String TAG;
int lado, i;

void setup()
{
  size(800, 800);
  background(60);
  smooth();

  TAG = "Alaska";
  lado = 10;

  posx=0;
  posy=0;
}

void draw()
{
  // URL de consulta del API de flickr
  String urlFlickr = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=6171d315cac854b0b270d04ab95c9d2b&tags="+TAG+"&per_page=100&format=rest&6171d315cac854b0b270d04ab95c9d2b";

  // Objeto que lee la respuesta en XML
  XMLElement xmlFlickr = new XMLElement(this, urlFlickr);

  // Busco los elementos que necesito
  XMLElement[] xmlImagenes = xmlFlickr.getChildren("photos/photo");
  println(xmlImagenes.length);

  // Extraigo la información del elemento que necesito y la dejo en variables
  String farmId = xmlImagenes[i].getString("farm");
  println(farmId);
  String serverId = xmlImagenes[i].getString("server");
  println(serverId);
  String secret = xmlImagenes[i].getString("secret");
  println(secret);
  String photoId = xmlImagenes[i].getString("id");
  println(photoId);
  String titulo = xmlImagenes[i].getString("title");
  println(titulo);

  // Construyo la URL para descargar la imagen
  String urlImagen = "http://farm"+farmId+".staticflickr.com/"+serverId+"/"+photoId+"_"+secret+".jpg";
  println(urlImagen);

  // Descargo la imagen de flickr según la url
  PImage imagen = loadImage(urlImagen);

  // Variables para describir el movimiento de las imágenes.

  image(imagen, posx, posy, width/lado, width/lado);
  posx = posx + (width/lado);
  if (posx>=width)
  {

    posy = posy +(height/lado);
    image(imagen, posx, posy, width/lado, width/lado);
    posx=0;
  }

  i++;

  //-----------------------------------------------
  //      Yahoo Weather
  //-----------------------------------------------


  // URL de consulta del API de Yahoo
  String urlYahoo = "http://weather.yahooapis.com/forecastrss?w=23390126&u=c";

  // Objeto que lee la respuesta en XML
  XMLElement xmlYahoo = new XMLElement(this, urlYahoo);

  // Busco los elementos que necesito
  XMLElement[] xmlClima = xmlYahoo.getChildren("channel/item/yweather:condition");
  println(xmlClima.length);

  // Extraigo la información del elemento que necesito y la dejo en variables
  String Temperatura = xmlClima[0].getString("temp");
  println("Temperatura es "+Temperatura);

  // Pinto la informcion en pantalla
  fill(#FFFFFF, 10);
  /*textFont(createFont("Helvetica-Light", 200));
   text("Alaska", 100, 350);
   textFont(createFont("Helvetica-Light", 300));
   text(Temperatura+"ºC", 95, 600);
   */
  textSize(180);
  text("Alaska", 120, 350);
  textSize(250);
  text(Temperatura+"ºC", 100, 550);
}  ////  FINAL


