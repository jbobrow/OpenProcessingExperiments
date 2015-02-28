
String urlFlickr;
XMLElement xmlFlickr;
XMLElement[] xmlImagenes;

int indice;

float posx;
float posy;

int pointillize = 40;



void setup()
{
  size(1000,700);
  background(255);
  smooth();
  posx = 0;
  posy = 0;
 
  urlFlickr = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=378d5a1775fa8761d4711276b1e1d5c1&tags=Paris%2Clandscape&tag_mode=all&format=rest";

  xmlFlickr = new XMLElement(this, urlFlickr);
  xmlImagenes = xmlFlickr.getChildren("photos/photo");
  
  indice = 0;
  
  while(indice < 100)
{ 
   
    String farmId = xmlImagenes[indice].getString("farm");
    String serverId = xmlImagenes[indice].getString("server");
    String secret = xmlImagenes[indice].getString("secret");
    String photoId = xmlImagenes[indice].getString("id");
    String titulo = xmlImagenes[indice].getString("title");
  
    String urlImagen = "http://farm"+farmId+".staticflickr.com/"+serverId+"/"+photoId+"_"+secret+".jpg";
  
    PImage imagen = loadImage(urlImagen);
    imagen.resize(100,100);
    image(imagen,posx,posy); 
   
    indice = indice+1;
    
    posx= posx + 100;
    
    
    if (posx > width) 
   {
      posx = 0; 
      posy = posy+100; }
     
  

}    
 
 
}

void draw()

{  

  
  
  
      
/// código circulillos de color      
    
  //Acá se elige un pixel random de la imagen   
    int x = int(random(width));
    int y = int(random(height));

  
  //Acá se convierte en variable la informaciòn de la locación donde está 
  int loc = x + y*width; 
  
  
  
  // Acá se extrae la informaciòn del color que tiene ese pixel 
  loadPixels();
  float r = red(pixels[loc]);
  float g = green(pixels[loc]);
  float b = blue(pixels[loc]);
  noStroke();
  
  // Acá se pinta una elipse en esa locación con ese color 
  fill(r,g,b);
  ellipse(x,y,pointillize,pointillize);

/// fin del código
  
 
  
}

