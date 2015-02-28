

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
  // URL de consulta del API de flickrç
 
  background(255);
  String url43things = "http://www.43things.com/rss/goals/popular";

  // Objeto que lee la respuesta en XML
  
  
  XMLElement xml43things = new XMLElement(this,url43things);

  // Busco los elementos que necesito

  
  XMLElement[] xmlMetas = xml43things.getChildren("channel/item/title");
  
 

  // Extraigo la información del elemento que necesito y la dejo en variables
  
  

  
  
  int numero=(int)random(25);
  String titleId = xmlMetas[numero].getContent();
  String tag= titleId;
  String urlFlickr = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=876101b55da8f4d2a216de2f804e6599&tags="+tag+"&format=rest";
  
  XMLElement xmlFlickr = new XMLElement(this,urlFlickr);
  
  XMLElement[] xmlImagenes = xmlFlickr.getChildren("photos/photo");
  
  String farmId = xmlImagenes[0].getString("farm");
  String serverId = xmlImagenes[0].getString("server");
  String secret = xmlImagenes[0].getString("secret");
  String photoId = xmlImagenes[0].getString("id");
  String titulo = xmlImagenes[0].getString("title");
  
  //String[] list = split(titleId, ' ');
  //int i=0;
//int size=0;
 // String Resultado="";
 // while(i<list.length)
 // {
   // if(list[i].length()>size)
  //  {
  //    Resultado=list[i];
   //   size=list[i].length();
   // }
   // i++;
  //}
  
  posx = random(0, 500);
  posy = random(0, 500);
  
  //resetMatrix();
  //translate(posx, posy);
  //rotate(random(-PI/4,PI/6));
//imageMode(CENTER);
 // text(titleId,0,0);
  
 
  PFont f = loadFont("CharcoalCY-30.vlw");
  fill(random(255),random(255),random(255));
  textFont(f,30);
  text(titleId,40,550);

  // Construyo la URL para descargar la imagen
  String urlImagen = "http://farm"+farmId+".staticflickr.com/"+serverId+"/"+photoId+"_"+secret+".jpg";

  // Descargo la imagen de flickr según la url
  PImage imagen = loadImage(urlImagen);

  // Variables para describir el movimiento de las imágenes.
  rotacion = random(1);
  posx = random(200, width-200);
  posy = random(200, height-200);

  // Pinto la imagen dando el efecto de desorden y superposición entre ellas
  
 image(imagen,0,0);
  
}

