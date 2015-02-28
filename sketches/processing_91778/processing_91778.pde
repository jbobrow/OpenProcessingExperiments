
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
PFont fuente;

// -----------------------------------------
// Método setup de la composición
// -----------------------------------------
void setup()
{
  size(600, 600);
  background(255);
  smooth();
  fuente = loadFont("AmericanTypewriter-Condensed-48.vlw");
}

// -----------------------------------------
// Método setup de la composición
// -----------------------------------------
void draw()
{
  //----------------------------------------
  //      BUSCAR PALABRA 43THINGS
  //-----------------------------------------

  String url43things = "http://es.43things.com/rss/goals/all";  // URL con el API de 43 Things
  XMLElement xml43things = new XMLElement(this, url43things);  //  Guardo el XML en la variable
  XMLElement[] xmlTitulos = xml43things.getChildren("channel/item/title"); // Cargo el arreglo con cada hijo
  int i = int(random(xmlTitulos.length)); // Variable aleatoria con maximo el tamaño del arreglo

  String titulo43 = xmlTitulos[i].getContent(); // Asigno la frase a la cadena
  println(titulo43); // Imprimo en la salida. Control

  String[] palabras = split(titulo43, ' ');  // parto

  String TAG = palabras[int(random(random(palabras.length)))];

  println(TAG);



  //----------------------------------------
  //      BUSCAR IMAGENES FLICKR
  //-----------------------------------------


  // URL de consulta del API de flickr
  String urlFlickr = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=6171d315cac854b0b270d04ab95c9d2b&tags="+TAG+"&per_page=10&format=rest&6171d315cac854b0b270d04ab95c9d2b";
  println(urlFlickr);
  
  // Objeto que lee la respuesta en XML
  XMLElement xmlFlickr = new XMLElement(this, urlFlickr);

  // Busco los elementos que necesito
  XMLElement[] xmlImagenes = xmlFlickr.getChildren("photos/photo");

  // Extraigo la información del elemento que necesito y la dejo en variables
  String farmId = xmlImagenes[0].getString("farm");
  println(farmId);
  String serverId = xmlImagenes[0].getString("server");
  println(serverId);
  String secret = xmlImagenes[0].getString("secret");
  println(secret);
  String photoId = xmlImagenes[0].getString("id");
  println(photoId);
  String titulo = xmlImagenes[0].getString("title");
  println(titulo);

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
  image(imagen, 0, 0);
  
  fill(255);
  textFont(fuente, 50);
  text(TAG, 150, 300); 
  
}


