
import ddf.minim.signals.*;
import ddf.minim.*;

Minim minim; 
AudioOutput sortie; 
SawWave scie;
SineWave sine;
 
 
void setup(){
  size(700, 400);
  PImage monImage;
 monImage = loadImage ("7.jpg");
 image (monImage, 0,0);
 
   noFill();
 strokeWeight (10);
 stroke (0, 100);
 smooth();

ellipseMode (CENTER);
ellipse (350, 190, 150, 110);
ellipse (350, 190, 180, 180);
ellipse (350, 190, 210, 210);
ellipse (350, 190, 240, 240);
ellipse (350, 190, 280, 280);
ellipse (350, 190, 370, 320);
ellipse (350, 190, 460, 360);
ellipse (90, 42, 150, 50);
ellipse (610, 42, 150, 50);
ellipse (610, 342, 150, 50);
ellipse (90, 342, 150, 50);

 
  PFont maTypo = loadFont ("BatmanForeverAlternate-48.vlw");
 textFont (maTypo, 28);
 fill (0, 100);
 text("HEART                            NIGHT", 35, 50);
 textFont (maTypo, 40);
 fill (255);
 text ("SOUND YOUR MOUSE", 90, 200);
  textFont (maTypo, 28);
 fill (0, 100);
 text("SOFT                             HARD", 40, 350);
 

  //exemple minim pris dans le livre processing de Géridan et Lafargue
  minim = new Minim(this); 
  sortie = minim.getLineOut(Minim.STEREO, 512);
  scie=new SawWave(440, 1, 44100);
  sine=new SineWave(440, 1, 44100);
  sortie.addSignal(scie);
  sortie.addSignal(sine);
}

void draw(){
  scie.setFreq(mouseY);
  sine.setFreq(mouseX);
}

void stop(){
  minim.stop();
  super.stop();
}


