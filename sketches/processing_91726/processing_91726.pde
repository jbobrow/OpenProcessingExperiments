
float posX;
float posY;
float tam1;
float tam2;
int foto;

XMLElement[] xmlImagenes;

XMLElement xmlFlickr;

String urlFlickr;


void setup()
{
  size(900, 900);
  background(0);
  smooth();
 
   
  
  posX=0;
  posY=0;
  tam1=100;
  tam2=100;
  
foto = 0;
 
urlFlickr = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=e2d40d416a86ade2b5d73f40994eeaa7&tags=love&format=rest";
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


  String urlImagen = "http://farm"+farmId+".staticflickr.com/"+serverId+"/"+photoId+"_"+secret+".jpg";

 
  PImage imagen = loadImage(urlImagen);
  image (imagen,posX,posY,tam1,tam2);
  
  
  
  tam1 = tam1+100;
  tam2 = tam2+100;   

  if (tam1 >= 1000) {
   tam1 = tam1-1000;

   
      
   }
   
 if (tam2 >= 1000) {
 tam2 = tam2-1000;  
 } 



   
  foto ++;
  

  
}  

