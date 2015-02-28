


//convolution de jacques maire
PImage img,gaga;
float tempo;
void setup()
{

     size(545, 568);
     frameRate(5);    
     img = loadImage("gaga.png");
     gaga = loadImage("gaga.png");
     image(img, 0, 0, width, height);
     img.loadPixels();
     for (int x = 0; x< width; x++)
          for (int y = 0; y< height; y++)
          {
               float xx=sin(((float)x-width/2.0)/width);
               float yy=cos(((float)y-height/2.0)/height);
               int col= img.pixels[y*width + x] ;
               float rouge=red(col);
               float vert=green(col);
               float bleu=blue(col);
               img.pixels[y*width + x] =
                    color(constrain(rouge, 120, 225), constrain(vert, 20, 225), constrain(bleu, 120, 225), constrain(alpha(col), 50, 255) );
          }
     img.updatePixels();
}



void draw()
{ 
   tempo=0.4*cos(millis()/100);
     img.loadPixels();
     for (int x = 1; x< width-1; x++)
          for (int y = 1; y< height-1; y++)
          {

               int src= img.pixels[y*width + x];
               int but =  (int)((
               img.pixels[y*width + x]*5.70001 +
                    img.pixels[y*width + x-1]*0.00002*tempo +
                    img.pixels[y*width + x+1]*0.00003*tempo +
                    img.pixels[(y-1)*width + x]*0.000002*tempo+
                    img.pixels[(y+1)*width + x]*0.000005 ) / (5.6004001+tempo/100));
               img.pixels[y*width + x]=couleur(src, but);
                img.pixels[y*width + x]=int(img.pixels[y*width + x]*tempo+gaga.pixels[y*width + x]*(1-tempo));
          }
     img.updatePixels();
     image(img, 0, 0);
     // image(gaga, 0, 0, width, height);
}


int couleur(int s, int b) {
     return color(red(s)*0.4+red(b)*0.6, green(s)*0.4+green(b)*0.6, blue(s)*0.4+blue(b)*0.6, alpha(s)*0.4+alpha(b)*0.6);
}



