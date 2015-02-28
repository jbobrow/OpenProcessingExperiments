
//Variables API
String urlFlickr;
XMLElement xmlFlickr;
XMLElement[] xmlImagenes;
int indice;

//Variables para dibujo de paleta
float posx;
float posy;
int rectangulo;

//Variables para arreglos de colores
color[] colores;
int indiceColores;
int numeroColores;



void setup()
{
  size(700, 700);
  background(0);
  smooth();
  posx = 0;
  posy = 0;
  rectangulo = 5;
  
 

  urlFlickr = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=378d5a1775fa8761d4711276b1e1d5c1&tags=london%2Cskyline&tag_mode=all&format=rest";
  
  xmlFlickr = new XMLElement(this, urlFlickr);
  xmlImagenes = xmlFlickr.getChildren("photos/photo");

  indice = 0;

  while(indice < 70)
  {
    String farmId = xmlImagenes[indice].getString("farm");
    String serverId = xmlImagenes[indice].getString("server");
    String secret = xmlImagenes[indice].getString("secret");
    String photoId = xmlImagenes[indice].getString("id");
    String titulo = xmlImagenes[indice].getString("title");
    String urlImagen = "http://farm"+farmId+".staticflickr.com/"+serverId+"/"+photoId+"_"+secret+".jpg";
  
    PImage imagen = loadImage(urlImagen);
    imagen.resize(100, 100);
    image(imagen, posx, posy); 
  
    indice = indice+1;
  
      posx= posx + 100;

      if (posx >= width) 
      {
        posx = 0; 
        posy = posy+100;
      }
  
  
  }


   // Inicializar arreglo de colores (paleta definitiva)
    numeroColores =500;
    colores = new color [numeroColores];
    indiceColores= 0;
    
}


void draw()
{
  
  
  loadPixels();
   
  
  for (int x =0; x < width; x= x + 25)
  {
    for( int y =0; y < height; y= y+25)
    {
      int loc = x + (y*width);
      
      float r = red(pixels[loc]);
      float g = green(pixels[loc]);
      float b = blue(pixels[loc]);
       
      noStroke();
      
      
      fill(r,g,b);
      rect (x,y,25,25); 
      
      /*
      //segunda paleta
            if (indiceColores < 500)
        {
          colores [indiceColores] = color(r, g, b);
          indiceColores++;
        }
        
        if(indiceColores == 500)
        {
          int indiceAdicional = 0;
          
          while (indiceAdicional < 500) 
          {
            int xP = indiceAdicional*20;
            int yP= 0;
            fill (colores[indiceAdicional]);
            rect (xP, yP, 20,20);
            indiceAdicional++;
             
            if (xP>=700) 
            {
              xP=0;
              yP = yP+20;
            } 
           
           }
          
          
        }
        */
       
      
      
    }
  }
 
  

  
}




