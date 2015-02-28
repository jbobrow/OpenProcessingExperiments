


/* Vitraux
 *jacques maire
 *fait le 13/02/2013
 
 *credit: Bogdan Vera, http://www.openprocessing.org/sketch/57300
 */

PImage gfxImage;
float coefX, coefY;
boolean stop;
void setup()
{    
  size(766, 766);
  frameRate(30);
  stop=false;
  gfxImage = createImage(width, height, RGB);
  gfxImage.loadPixels();
  init(2.73, 1.78);
}
void init(float coef1, float coef2) { 
  float sx, cx; 
  for (int x = 0; x< width; x++)
    for (int y = 0; y< height; y++)
    {
      sx =0.001+sin(((float)x/(float)width));
      cx =0.001+cos(((float)y/(float)width));
      gfxImage.pixels[y*width + x] =
        color(1/sq(sx-cx*coef1), 1/abs((sq(sx)+sq(cx))), 1/abs((cos(sx)-sin(cx)*coef2)) );
    }//
  gfxImage.updatePixels();
} 


void draw()
{
  background( 255);
  if(!stop){
  gfxImage.loadPixels();
  for (int x = 1; x< width-1; x++)
    for (int y = 1; y< height-1; y++)
    {
        gfxImage.pixels[y*width + x] =  (int)((
        gfxImage.pixels[y*width + x] +
        gfxImage.pixels[y*width + x-1] +
        gfxImage.pixels[y*width + x+1] +
        gfxImage.pixels[(y-1)*width + x] +color(255*coefX, 0, 255*coefY)+
        gfxImage.pixels[(y+1)*width + x] ) / (5.083)

      );
    }
  gfxImage.updatePixels();}
  image(gfxImage, 0, 0);
  coefX=(float)mouseX/((float)width);
  coefY=(float)mouseY/((float)height);
}
void mousePressed() {
  coefX=(float)mouseX/((float)width);
  coefY=(float)mouseY/((float)height);
  init(coefX*3, coefY*6);
}
void keyPressed(){
  if(stop && (key == 'p' || key == 'P'))save("vitrail.tif");
stop=!stop;
}



