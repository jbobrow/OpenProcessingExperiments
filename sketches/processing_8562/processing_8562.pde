
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;



void setup () {
  
     minim= new Minim(this);
  player = minim.loadFile("secureplace.mp3");
  
  size(500,500);
  smooth();
  background(0);
}

void draw () {
  
   player.play();
  
     stroke(0,150,200,25);
  fill(0,0,0,50);
  ellipse(250,250,mouseX,mouseY); // rings echoing the piano keys
  
}

void mousePressed() {
  background(0,0,0); // Click mosue resets to all black Background
  
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
}

// Slow mouse creates MANY soft rings
// Blue on Black - unsettling atmosphere - free from fear, for now

// Mouse click resets the background to black

