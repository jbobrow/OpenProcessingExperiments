
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: CHOI Joo HEe
// ID: 201420114

import ddf.minim.*;

Minim minim;
AudioPlayer song;

float x = 0;
float y = 0;

void setup () {
size (400, 400);
noStroke ();

minim = new Minim (this);
song = minim.loadFile("uniclock.wav");
song.play ();
}

void draw () {
fill (255);
rectMode (CORNER);
rect (0, 0, width, height);

float dimension = song.mix.level() * 250;

  for ( int i=0;i<width;i=i+100) {
    for ( int j=0;j<height;j=j+200) {
     stroke(#70A5FC,100);
     strokeWeight(10);
     ellipse(i+10,i+10,100,100);
     ellipse(i+10,i+10,dimension,dimension);
     ellipse(i+10,i+10,2,2);
     ellipse(i+10,i+10,2,2);
     ellipse(i+10,i+10,15,15);

     ellipse(i+200,i+10,100,100);
     ellipse(i+200,i+10,dimension,dimension);
     ellipse(i+200,i+10,2,2);
     ellipse(i+200,i+10,2,2);
     ellipse(i+200,i+10,15,15);
     
     ellipse(i+400,i+10,100,100);
     ellipse(i+400,i+10,dimension,dimension);
     ellipse(i+400,i+10,2,2);
     ellipse(i+400,i+10,2,2);
     ellipse(i+400,i+10,15,15);  

     ellipse(i-200,i+10,100,100);
     ellipse(i-200,i+10,dimension,dimension);
     ellipse(i-200,i+10,2,2);
     ellipse(i-200,i+10,2,2);
     ellipse(i-200,i+10,15,15);     
     
     fill(255);
     rect(i+100,i,dimension,dimension);
     rect(i-100,i,dimension,dimension);
     rect(i+300,i,dimension,dimension);
     rect(i-300,i,dimension,dimension);

   }
  }
}

