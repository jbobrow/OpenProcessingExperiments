
/**
 * La siguiente composición busca las imágenes que se están subiendo a flickr
 * y las pinta. "The world of images"
 * Autor: Camilo Jiménez - Twitter: @camilji
 */

// -----------------------------------------
// Variables de la composición
// -----------------------------------------
float rotacion;
float posx;
float posy;

// -----------------------------------------
// Método setup de la composición
// -----------------------------------------
void setup()
{
  size(600,600);
  background(255);
  smooth();
}

// -----------------------------------------
// Método setup de la composición
// -----------------------------------------
void draw()
{
  // URL de consulta del API de flickr
  String urlFlickr = "http://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=6171d315cac854b0b270d04ab95c9d2b&per_page=1&format=rest";

  // Objeto que lee la respuesta en XML
  XMLElement xmlFlickr = new XMLElement(this, urlFlickr);

  // Busco los elementos que necesito
  XMLElement[] xmlImagenes = xmlFlickr.getChildren("photos/photo");

  // Extraigo la información del elemento que necesito y la dejo en variables
  String farmId = xmlImagenes[0].getString("farm");
  String serverId = xmlImagenes[0].getString("server");
  String secret = xmlImagenes[0].getString("secret");
  String photoId = xmlImagenes[0].getString("id");
  String titulo = xmlImagenes[0].getString("title");

  // Construyo la URL para descargar la imagen
  String urlImagen = "http://farm"+farmId+".staticflickr.com/"+serverId+"/"+photoId+"_"+secret+".jpg";

  // Descargo la imagen de flickr según la url
  PImage imagen = loadImage(urlImagen);

  // Variables para describir el movimiento de las imágenes.
  rotacion = random(1);
  posx = random(200, width-200);
  posy = random(200, height-200);

  // Pinto la imagen dando el efecto de desorden y superposición entre ellas
  resetMatrix();
  translate(posx, posy);
  rotate(rotacion);
  imageMode(CENTER);
  image(imagen,0,0);
}

