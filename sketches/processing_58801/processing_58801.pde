


//convolution de jacques maire
PImage img,gelina;
float tempo;
boolean avance;
void setup()
{

     size(801, 612);
     
     avance=true; 
     tempo=0.000053;
     img = loadImage("gelina2.png");
     gelina = loadImage("gelina1.png");
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
                    color(constrain(sq(rouge*vert*y*x), 0, 255), constrain(sqrt(rouge*vert*x*y), 0, 255), constrain(sqrt(bleu*vert*x*y), 0, 255), constrain(sqrt(bleu*rouge)*alpha(col), 0, 255) );
       
          }
     img.updatePixels();
     gelina.updatePixels();
}



void draw()
{
    
     if(avance){
 
     img.loadPixels();
     for (int x = 1; x< width-1; x++)
          for (int y = 1; y< height-1; y++)
          {
               int src= img.pixels[y*width + x];
               int but =  (int)((
               img.pixels[y*width + x]*(20.07*tempo) +
                    img.pixels[y*width + x-1]*tempo +
                    img.pixels[y*width + x+1]*tempo +
                    img.pixels[(y-1)*width + x]*tempo+
                    img.pixels[(y+1)*width + x]*tempo ) / (21.399991*tempo));
               img.pixels[y*width + x]=couleur(src, but);
                img.pixels[y*width + x]=int(img.pixels[y*width + x]*tempo+gelina.pixels[y*width + x]*(1-tempo));
          }
     img.updatePixels();
     avance=false;
      
}
     image(img, 0, 0);
 
}


int couleur(int s, int b) {
     return color(red(s)*0.4+red(b)*0.6, green(s)*0.4+green(b)*0.6, blue(s)*0.4+blue(b)*0.6, alpha(s)*0.4+alpha(b)*0.6);
}
void mousePressed() {
      tempo=sqrt(mouseX*mouseY)/10000;
      println(tempo);
 avance=true;
}


