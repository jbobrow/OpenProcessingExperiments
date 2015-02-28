
PImage fuente,destino;    
void setup() 
{
  size(200,200);
  fuente = loadImage("simpsonizado.jpg");
  destino = createImage(fuente.width, fuente.height, RGB);
}

void draw() 
{
  float threshold = 127;
  fuente.loadPixels();
  destino.loadPixels();
  
  for (int x = 0; x < fuente.width; x++ ) 
  {
      for (int y = 0; y < fuente.height; y++ ) 
      {
          int pos = x + y*fuente.width;
          if (brightness(fuente.pixels[pos]) > threshold)
          {
              destino.pixels[pos] = color(255);
          } 
          else 
          {
              destino.pixels[pos] = color(0);
          }
      }
  }
  destino.updatePixels();
  image(destino,0,0);
}

