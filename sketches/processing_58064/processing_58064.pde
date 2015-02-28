

//convolution de jacques maire
//Le portrait d' AW est de BENHEINE visible ici:
//http://fr.toonpool.com/cartoons/Andy%20Warhol%20-%20Detail%20Head_70483
PImage img;
float l=0.135;
float ll=1-l;
void setup()
{

     size(564, 720);
     frameRate(4);    
     img = loadImage("564720.png");
     image(img, 0, 0, width, height);
     img.loadPixels();
     for (int x = 0; x< width; x++)
          for (int y = 0; y< height; y++)
          {
               int col= img.pixels[y*width + x] ;
               float rouge=red(col);
               float vert=green(col);
               float bleu=blue(col);
               img.pixels[y*width + x] =
                    color(constrain(rouge, 0, 125), constrain(vert, 30, 250), constrain(bleu, 30, 200), constrain(alpha(col), 50, 240) );
          }
     img.updatePixels();
}



void draw()
{ 
     
     img.loadPixels();
     for (int x = 2; x< width-2; x++)
          for (int y = 2; y< height-2; y++)
          {

               int src= img.pixels[y*width + x];
               int but =  (int)((
               img.pixels[y*width + x]*5.6012399 +
                    img.pixels[y*width + x-1]*0.00001 +
                    img.pixels[y*width + x+1]*0.00001 +
                    img.pixels[(y-1)*width + x+2]*0.00001+
                    img.pixels[(y-1)*width + x]*0.00001+
                     img.pixels[(y-1)*width + x-2]*0.00001+
                     img.pixels[(y-2)*width + x]*0.00001+
                      img.pixels[(y+2)*width + x]*0.00001+
                    img.pixels[(y+1)*width + x]*0.00001 ) / 5.599440005);
               img.pixels[y*width + x]=couleur(src, but);
          }
     img.updatePixels();
     image(img, 0, 0);
}


int couleur(int s, int b) {
     return color(red(s)*l+red(b)*ll, green(s)*l+green(b)*ll, blue(s)*l+blue(b)*ll, alpha(s)*l+alpha(b)*ll);
}


