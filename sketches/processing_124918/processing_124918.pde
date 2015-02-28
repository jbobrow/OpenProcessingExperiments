
// Jungle Dome by Yves DEPIESSE
// Final Project 3 for coursera.org "Computer Art" course
// In this project I try to use all the concept we have learn during the course.
// Random, color, sound, image, keyrelease ...
// This is not 100% perfect as I wanted 
//key t = show the tiles on the screen where there was generated.

import ddf.minim.*;
final int TAILLE = 10;
PImage photo;
float[] tableauDeX;
float[] tableauDeY;
color[] palette = {#C5299B,#FE5000,#FFCD00,#78BE20,#0095C8,#FF8830,#A6B06D,#589482,#E2CA1A,#C72B10};


color[] colorOfSound;
// A jingle object (that will trigger the sound)
Minim minim;
Minim jungle;
//AudioPlayer player;
Tile[] tiles;
String[] soundFile={"1.mp3","2.mp3","3.mp3","4.mp3","5.mp3","6.mp3","7.mp3","8.mp3","9.mp3","10.mp3"};
AudioPlayer jungleMusic;
boolean drawTile = false;

PFont font;

void setup() {
  size(810, 600);
  // start up Minim
  minim = new Minim(this);
  jungle = new Minim(this); 
  cursor(MOVE);
  jungleMusic = jungle.loadFile("ambiance.mp3", 1024);
  jungleMusic.loop();
  
  tableauDeX = new float[TAILLE];
  tableauDeY = new float[TAILLE];
  tiles = new Tile[TAILLE];
  colorOfSound = new color[TAILLE];
  
  photo = loadImage("jungle.jpg");
  image(photo, 0, 0);
  smooth();
  font = loadFont("Arial-Black-48.vlw");
  textFont(font);
  textSize(35);
  text("JUNGLE DOME", 500,580);

  noStroke();
  
  for ( int i =0; i < TAILLE ; i = i + 1) { 
    tableauDeX[i] = random(0, width - 20);
    tableauDeY[i] = random(0, height - 100);
     
    float r = random (0,10);
      
    colorOfSound[i] = palette[int(r)];
    tiles[i] = new Tile(soundFile[int(r)]);
    
  }
}

void draw() {
  for ( int i =0; i < TAILLE ; i = i + 1) { 
    if (drawTile) {
          tiles[i].drawTile( tableauDeX[ i ] ,  tableauDeY[ i ]);
    }
    if (tiles[i].mouseOver( tableauDeX[ i ] ,  tableauDeY[ i ])) {
      fill(colorOfSound[i]);
      rect( tableauDeX[ i ] ,  tableauDeY[ i ] , 20, 20);
    } 
 
  }
}

 
// clean up Minim before exiting
void stop()
{
for ( int i =0; i < TAILLE ; i = i + 1) { 
    tiles[i].stop();
}
  super.stop();
}

void keyReleased() {

  if (key == 't' || key == 'T'){
  drawTile = !drawTile;
  } 
}

class Tile {
  AudioPlayer song;
  float x;
  float y;
  boolean playing;

 color[] palette = {#C5299B,#FE5000,#FFCD00,#78BE20,#0095C8};
   
  Tile(String audioFile) {
    song = minim.loadFile(audioFile, 1024);
    playing = false;
  }
  
   void drawTile(float x, float y ) {
      float s = random (0,5); 
      fill(255);
      rect(x, y, 20,20);
    }

   boolean mouseOver(float x, float y) {
     boolean over = false;
     float range = 20.0;
     float minX = x - range;
     float maxX = x + range;
     float minY = y - range;
     float maxY = y + range;
     if (mouseX >= minX && mouseX <= maxX &&
         mouseY >= minY && mouseY <= maxY) {
           if (playing == false) {
             playing = true;
             song.play(0);
           }
           over = true;
     }
    checkForEnd();
    return over;
   }
    
   void stop() {
     song.close();
   }
    
  void checkForEnd() {
    if (song.length() - song.position() < 20) {
      song.pause();
      playing = false;
    }
  }
}


