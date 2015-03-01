
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


//Import 'Minim' library files
import ddf.minim.*;

int savenr;
PImage baleeira;
PImage baleeira_2;
Minim minim;
AudioSample Bloop_2;

void setup() {
  
  size(900, 600);
  noCursor();
  baleeira = loadImage("baleeira.jpg");
  baleeira_2 = loadImage("baleeira_2.jpg");
  minim = new Minim(this);
  Bloop_2 = minim.loadSample("Bloop_2.wav");
  
}

void draw() {
  image(baleeira, 0, 0);

}

void mouseMoved() {
  image(baleeira_2, 0, 0);
  Bloop_2.trigger();
  
} 

void keyPressed() {

  if(key == 's') {
    savenr ++;
    saveFrame("bizarre_" +savenr + ".png");
    
  
  }
  
  
}

