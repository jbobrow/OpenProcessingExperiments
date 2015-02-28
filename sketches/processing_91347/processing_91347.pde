
String urlFlickr;
XML xmlFlickr;
XML[] xmlImagenes;

int indice;

float posx;
float posy;

int pointillize = 20;



void setup()
{
  size(1000,700);
  background(255);
  smooth();
  posx = 0;
  posy = 0;
 
  urlFlickr = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=fcd750b05ec12540840ef4b189dce5a0&tags=bogota%2Camanecer&tag_mode=all&format=rest&api_sig=f0ddacb066ffdc553073255408ee6c6c";
  xmlFlickr = loadXML(urlFlickr);
  xmlImagenes = xmlFlickr.getChildren("photos/photo");
  
  indice = 0;
 
}

void draw()

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
    
  //  if (posy > height) 
// {
    //posy = 0; 
    //}
    
    
  
  if (indice>= 80) 
     {
      indice = 0;
 
      } 
      
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


