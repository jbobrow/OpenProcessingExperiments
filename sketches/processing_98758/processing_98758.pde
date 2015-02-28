
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


Minim minim;
AudioPlayer chord1;
AudioPlayer chord2;
AudioPlayer chord3;
AudioPlayer chord4;

void setup() {
  size(320,480);
  
  minim = new Minim(this);
  
  chord1 = minim.loadFile("chord1.mp3");  
  chord2 = minim.loadFile("chord2.mp3");
  chord3 = minim.loadFile("chord3.mp3");
  chord4 = minim.loadFile("chord4.mp3");
  
//Screen is divided into four different colours.

noStroke();
rect(0,0,160,240);
rect(160,0,160,240);
rect(0,240,160,240);
rect(160,240,160,240); 

}

//Mouse click can represent iPhone tap.
//Different colours play different chords. 

void draw() {
  //Clicking on different sections of the screen.
  if (mouseX<width/2 && mouseY<height/2 && mousePressed == true) {
    //flickering colour further associates sound with colour; synesthesia
    fill (random(105, 240), random(160, 240), 220);
   chord1.play();
   chord1 = minim.loadFile("chord1.mp3");
  } else {
    fill(#4dd2dc);
  }
  rect(0,0,160,240);
  if (mouseX>width/2 && mouseY<height/2 && mousePressed == true) {
    fill(random(105, 240), random(160, 240), 220);
   chord2.play();
   chord2 = minim.loadFile("chord2.mp3");
  } else {
    fill(#ffcedc);
  }
  rect(160,0,160,240);
  if (mouseX<width/2 && mouseY>height/2 && mousePressed == true) {
    fill(random(105, 240), random(160, 240), 220);
    chord3.play();
    chord3 = minim.loadFile("chord3.mp3");
  } else {
    fill (#83ffdc);
  }
  rect(0,240,160,240);
  if (mouseX>width/2 && mouseY>height/2 && mousePressed == true) {
    fill(random(105, 240), random(160, 240), 220);
    chord4.play();
    chord4 = minim.loadFile("chord4.mp3");
  } else {
    fill(#ffffdc);
  }
  rect(160,240,160,240);
}




