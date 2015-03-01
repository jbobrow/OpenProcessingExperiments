
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Hyungi

import ddf.minim.*;
 
Minim minim;
AudioPlayer song;
 
float x = 0;
float y = 0;
 
void setup () {
size (displayWidth, displayHeight);
noStroke ();
 

minim = new Minim (this);
song = minim.loadFile("fire ball song.mp3");
song.play ();
}
 
void draw () {
background(0);
    for (int x = 0; x < width; x += 150) {
    for (int y = 0; y < height; y+= 150) {
       
      float dimension = song.mix.level() * 300;
       
      stroke (dimension);
      strokeWeight(5);
      fill(random(255));
      ellipse(x, y, 100,100);
      
       
      noStroke();
      fill(255,247,93);
      ellipse(x,y,dimension,dimension);
      
       
      stroke(0);
      strokeWeight(2);
      fill(229,255,126);
      ellipse(x,y,29,29);
}
 }
  }
void keyPressed() {
  background(0);
  redraw();
}

