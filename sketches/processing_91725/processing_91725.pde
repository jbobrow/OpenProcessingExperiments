
float posX;
float posY;
int foto;

XMLElement[] xmlImagenes;

XMLElement xmlFlickr;

String urlFlickr;


void setup()
{
  size(1000, 1000);
  background(0);
  smooth();
  
  posX=0;
  posY=0;
  
foto = 0;
 
urlFlickr = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=e2d40d416a86ade2b5d73f40994eeaa7&tags=tailandia&per_page=500&format=rest"; 
xmlFlickr = new XMLElement(this, urlFlickr); 
xmlImagenes = xmlFlickr.getChildren("photos/photo");

 
}


void draw()
{
 
  
                     


  String farmId = xmlImagenes[foto].getString("farm");
  String serverId = xmlImagenes[foto].getString("server");
  String secret = xmlImagenes[foto].getString("secret");
  String photoId = xmlImagenes[foto].getString("id");
  String titu = xmlImagenes[foto].getString("title");

  // Construyo la URL para descargar la imagen
  String urlImagen = "http://farm"+farmId+".staticflickr.com/"+serverId+"/"+photoId+"_"+secret+".jpg";

  // Descargo la imagen de flickr según la url
  PImage imagen = loadImage(urlImagen);
  image (imagen,posX,posY,100,100);
    
 
 posX= posX+100;

 
  if (posX >= width) {
   posX = 0;
   posY = posY+100;
      
   }
   
   if (posY >= height){
     posY = 0;     
   }
   
  foto ++;
  
}  





