
import processing.video.*;

Capture video;
//int posx;

PImage prevFrame;

float threshold =50;

void setup()

{
  

size(400,300);
//posx =0;
                           //  15 cuadros por segundo(fps)
video = new Capture(this,400,300,20);


}

void draw()
{
background(0); 
 if (video.available())
 {
 video.read();
 }
 
 //image (video,0,0); 
 video.loadPixels();
 
 //filas
 for( int x =0; x < video.width; x= x + 10 )
 {
  //columnas
  for( int y =0; y< video.height; y = y + 10)
  {
    int loc = x + (y * video.width);
    
    float r = red (video.pixels[loc]);
    float g = green (video.pixels[loc]);
    float b = blue (video.pixels[loc]);
    
    //float maxdist = 100; //cambiar brillo
    //float d = dist (x,y,mouseX,mouseY);
   // float
    
    
    
    
 // color colorP =   video.pixels[loc];
  noStroke();
  fill(r,g,b);
  ellipse(x, y, 8, 8);
  }
 }
 
 
// tint(100);
 
 //posx++;
}

