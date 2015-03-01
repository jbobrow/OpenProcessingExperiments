
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/29566*@* */
/** Bruno Ministro a partir do código <br>
"Text - Pulse" de Bruno Richter <p>
cc dezembro 2013
**/

// sonoro_pt01


import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer som;


// visual_pt01

PFont font;
float x = 0;
float y = 0;
float a = 0;
float b = 0;
float c = 0;
float d = 255;

void setup() {
   size (591, 354, JAVA2D);
  smooth ();
  x = 250;
  y = 250;
  background (c);



// sonoro_pt02
  
  minim = new Minim(this);
  som = minim.loadFile("dueto.wav");
  som.loop();
  
}

// visual_pt02

 void draw () {
  if(mousePressed) {
    fill (0);
  } else {
    fill (255);
  }    
  
  c = random (1, 100);
  font = createFont ("Verdana", 100);
  pushMatrix();
  translate(a, b, c);
  textFont (font, 24);
  textAlign (CENTER);
  text ("tantas coisas para dizer", mouseX, mouseY);
  popMatrix();
  
}


