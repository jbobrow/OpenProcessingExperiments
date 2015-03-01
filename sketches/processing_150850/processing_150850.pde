

// Konkuk University 
// Department of Dynamic Media 
// SOS iDesign 
// Name:EOM Hyebin
// ID: EOM HYE BIN 

import ddf.minim.*; 
Minim minim; 
AudioPlayer song; 
float x = 0; 
float y = 0; 

void setup () { 
  size (1024, 1024); 
  noStroke (); 
  minim = new Minim (this); 
  song = minim.loadFile("2NE1=Crush.mp3"); 
  song.play ();
} 



void draw () { 
 // Size of the rect in relation to the volume of the audio file. 
  float dimension = song.mix.level() * 500; 


  background(0); 
  for (int a = 10; a<1024; a = a+200) { 
  for (int b = 10; b<1024; b = b+200) { 


  stroke(252,94,134); 
  strokeWeight(random(30)); 
    fill(255,203,216); 
      ellipse(a, b, dimension, dimension);
   
    }
  }
} 


void keyPressed() { 

  background(0); 
  redraw();
} 

