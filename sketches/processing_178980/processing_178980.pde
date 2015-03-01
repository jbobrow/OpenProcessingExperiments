

// import minim
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
// Declare 
Minim minim;
AudioSample bell;
// Alternativ mit audioPlayer bell; bei Erstellung der Skizze

// Load audio file from HDD
void setup() {
  minim = new Minim(this);
  bell = minim.loadSample("bell.wav");
  // wird hier ersetztt durch loadFile wenn Player verwendet wird
}

void draw (){
   background(0); 
}

// Draw 
void keyPressed() {
     if (key == 'b') {
        bell.trigger(); 
     }
     if (key == 'b') println("sample triggered");
  
}

