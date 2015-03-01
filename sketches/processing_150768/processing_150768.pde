
// Konkuk University 
// Department of Dynamic Media 
// SOS iDesign 
// Name: SHIN Yeon Sik 
// ID: dnmys11 


import ddf.minim.*; 
Minim minim; 
AudioPlayer song; 

float x; 
float y; 

void setup() { 
  size(600, 600); 
  background(0); 
  smooth(); 

  minim = new Minim (this); 
  song = minim.loadFile ("11.mp3"); 
  song.play (); 
  // noLoop();
} 

void draw () { 
  float dimension = song.mix.level() * 250; 
  for (int y = 0; y <=height; y +=50) { 
    for (int x = 0; x <=width; x +=50) { 
      noStroke(); 
      fill(random(255), 200); 
      rect(x, y, dimension, dimension);
    }
  }
}
