
String[]  mensajes;
float rotacion;
float posx;
float posy;
int indice;

// Método setup de la composición

void setup()
{
  size(1000,700);
indice=0;
  smooth();
  //indice=0;
  mensajes = loadStrings("http://es.43things.com/rss/goals/popular");
   frameRate(10);
}

// Método setup de la composición

void draw()
{
  // URL de consulta del API de flickr
  String url43 = "http://es.43things.com/rss/goals/popular";
  background(10);
  // Objeto que lee la respuesta en XML
  XMLElement xml43 = new XMLElement(this,url43);

  // Busco los elementos que necesito
  XMLElement[] xmlTexto = xml43.getChildren("channel/item/title");
translate(50,0);
  // Extraigo la información del elemento que necesito y la dejo en variables
int numero = (int)random(30);

String titleId = xmlTexto[numero].getContent();
  //String serverId = xmlImagenes[0].getString("server");
  //String secret = xmlImagenes[0].getString("secret");
  //String photoId = xmlImagenes[0].getString("id");
  //String titulo = xmlImagenes[0].getString("title");

  // Construyo la URL para descargar la imagen
  //String urlTexto = "http://farm"+farmId+".staticflickr.com/"+serverId+"/"+photoId+"_"+secret+".jpg";

  // Descargo la imagen de flickr según la url
  //PImage imagen = loadImage(urlImagen);
  
  posx=posx-10;
  
PFont f= loadFont("AppleCasual-11.vlw");
textFont(f,35);
fill (255,random (80,120),random (0,120));
text(titleId, posx/2,height-200);

String urlFlickr = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=f5013bd28015f609f32ab5b0174a2187&tags="+titleId+"&format=rest&auth_token=72157632797568911-c968e234374a3b3a&api_sig=5582248883de5e48a703fa9b9ef66a4c";

  // Objeto que lee la respuesta en XML
  XMLElement xmlFlickr = new XMLElement(this,urlFlickr);

  // Busco los elementos que necesito
  XMLElement[] xmlImagenes = xmlFlickr.getChildren("photos/photo");

if (xmlImagenes.length>0){
  
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




  image(imagen,100,0);

}
  



  // Pinto la imagen dando el efecto de desorden y superposición entre ellas
  //resetMatrix();

//rotate(rotacion);
  imageMode(CENTER);
  //image(imagen,0,0);
  
  
  
  
}

