


PImage ice;
void setup()
{

     size(400, 400);
     frameRate(30);    
     ice = loadImage("ICETEA.jpg");
     image(ice, 0, 0, width, height);
     ice.loadPixels();
     for (int x = 0; x< width; x++)
          for (int y = 0; y< height; y++)
          {
               float xx=sin(((float)x-width/2.0)/width);
               float yy=cos(((float)y-height/2.0)/height);
               int col= ice.pixels[y*width + x] ;
               float rouge=red(col);
               float vert=green(col);
               float bleu=blue(col);
               ice.pixels[y*width + x] =
                    color(constrain(rouge, 20, 225), constrain(vert, 20, 225), constrain(bleu, 20, 225), constrain(alpha(col), 50, 250) );
          }
     ice.updatePixels();
}



void draw()
{ 
     background(0,0,25);
     ice.loadPixels();
     for (int x = 1; x< width-1; x++)
          for (int y = 1; y< height-1; y++)
          {

               int src= ice.pixels[y*width + x];
               int but =  (int)((
               ice.pixels[y*width + x]*5.60012 +
                    ice.pixels[y*width + x-1]*0.0001 +
                    ice.pixels[y*width + x+1]*0.0001 +
                    ice.pixels[(y-1)*width + x]*0.0001+
                    ice.pixels[(y+1)*width + x]*0.0001 ) / 5.6004001);
               ice.pixels[y*width + x]=couleur(src, but);
          }
     ice.updatePixels();
     image(ice, 0, 0);
}


int couleur(int s, int b) {
     return color(red(s)*0.4+red(b)*0.6, green(s)*0.4+green(b)*0.6, blue(s)*0.4+blue(b)*0.6, alpha(s)*0.4+alpha(b)*0.6);
}


