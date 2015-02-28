
import processing.opengl.*;


import guru.ttslib.*;


TTS tts;
PImage imagen;
int cellsize = 3;
int columns, rows;
import processing.video.*;
Movie movie;


void setup(){
 size(640, 480, OPENGL); 
  


  smooth();
  tts = new TTS();

   imagen =loadImage ("2.jpg");
    columns = imagen.width / cellsize;
   rows = imagen.height / cellsize;
   movie = new Movie (this, "marcus_kellis_theme.mp3");
   }
void draw(){
background(0);  
loop();
   for ( int i = 0; i < columns; i++) {
    for ( int j = 0; j < rows; j++) {
       int x = i*cellsize + cellsize/2;
       int y = j*cellsize + cellsize/2;
        int loc = x + y*imagen.width;
        color c = imagen.pixels[loc];
         float z = (mouseX / float(width)) * brightness(imagen.pixels[loc]) - 20.0;

 pushMatrix();
      translate(x + 1, y + 1, z);
      fill(c, 204);
      noStroke();
      rectMode(CENTER);
       rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
   }

}


void keyPressed (){
  tts.speak("Hi my name is robotito, do you like dance with me to the rhythm of the music");

}

