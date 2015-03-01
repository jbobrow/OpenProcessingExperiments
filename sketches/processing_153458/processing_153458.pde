
import ddf.minim.*;
Minim minim;
AudioInput in;


void setup ()
{
  size (600,600);
  background (255);
  smooth();
  
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO,5000);
  
} 


void draw ()
{
  color a = color (237, 237, 237, 255);
  fill (a);
  alpha (a);
  background(in.mix.level()*800);
  
  PFont police;
  police = loadFont("Bauhaus93-48.vlw");
  textFont(police);
  textSize(in.mix.level()*800);
  textAlign(CENTER,CENTER);
  text ("Ecoutez !", 300,250);
  text("Il y a du bruit !", 300,300);
  text("Chaque jour c'est ainsi !", 300,350);
}  




