
PImage electrofest;
import ddf.minim.*;

Minim minim;
AudioPlayer estamosaqui;

void setup(){
  size(800, 600);
  electrofest = loadImage ("electrofest.jpg");
  minim = new Minim(this);
  estamosaqui = minim.loadFile ("estamosaqui.mp3");
  estamosaqui.play();
}


//draw()
void draw(){
image (electrofest,0,0);
       }

         
    


