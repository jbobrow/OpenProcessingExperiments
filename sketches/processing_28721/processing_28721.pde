
//Taylor Milner REVISED PROJ 2

/* This project demonstrates the 'narrative' of a song based on its beat detection. 
Try other songs in the folder because they have very different visual properties.*/

import ddf.minim.*;  
import ddf.minim.analysis.*;
import processing.dxf.*; 


boolean record = false;

Minim minim;    
AudioPlayer song; 

BeatDetect beat;  //detect beat
BeatListener bl;  //listen to beat


float kickSize, snareSize, hatSize;  //declare variable

float [] a = new float[110]; //109 cells


float cellSize =3; // size of strip

float interval =8; //sets up a time based interval that runs every 8 beats


float u,v;  //this draws the individual strips of information
//a counter is set up so that it an draw the information after every 8 beats.
int counter = 0;
int ticker = 0;



void setup() {
   size(500,500,P3D);




  
 background(0);
 
  lights();


  minim = new Minim(this);                      //  load Minum
  song = minim.loadFile("dre.mp3");   //  load your sound into Minum
  song.loop();


  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(01);              //set beat sensitivity
  kickSize = snareSize = hatSize = 16;     //set variables for the drawing
    bl = new BeatListener(beat, song);   // make a new beat listener so we won't miss any bufers for analysis
  
  a = new float[song.bufferSize()*height];

  smooth();
  noStroke();
}

void draw() {

   if (record == true) { 
    beginRaw(DXF, "output.dxf");   // Start recording to the file 
  } 

  if ( beat.isKick() ) kickSize =32;
  if ( beat.isSnare() ) snareSize = 32;
  if ( beat.isHat() ) hatSize = 32;
  
  //below is what I am trying to do with the quad strip - right now they are not responding to the output. 
   rotateX(-.5);
  rotateY(-.5);
  
  pushMatrix();
  translate(0,0,20);

  popMatrix();
  


  fill(230);

  translate(width/2,height/2,-50);

  camera(200,-200,800,150,0,150,0,1,0);

  translate(-100,0,0);

  counter++;


  if(counter == interval) {

    for(int i=0; i<song.bufferSize();i++) {
      a[i] = song.mix.get(i);
    }


    for(int j=1; j < height;j++) {
      for(int i=0; i < song.bufferSize();i++) {
        a[i + (j * song.bufferSize())] = a[i + ((j-1) * song.bufferSize())];
      }
    } 
      
    for (int j = 0; j <= cellSize; j++) {
  
   
      beginShape(QUAD_STRIP);
      for (int i = 0; i < width; i+=cellSize) {
   
        if(beat.isKick() ) fill(0,255,0);
            if(beat.isSnare() ) fill(255,0,0);
             if(beat.isHat() ) fill(0,0,255);
           

        u = 200 * a[i + (song.bufferSize()/width) + (j*song.bufferSize())];
        v = 205 * a[i + (song.bufferSize()/width) + ((j+1)*song.bufferSize())];

        vertex(i, u, j + (ticker*cellSize));
        vertex(i,v, j+cellSize + (ticker*cellSize));
      }

      endShape();
      //color strip based on 
   kickSize = constrain(kickSize * 0.95, 16, 32);
  snareSize = constrain(snareSize * 0.95, 16, 32);
  hatSize = constrain(hatSize * 0.95, 16, 32);
    }
   
  }

  if (counter >= interval) {
    counter = 0;
    ticker++;
  }
}


void stop()
{
  //closes minim audio classes when you are finished with them
  song.close();
  //stops minim before exiting
  minim.stop();
//closes the sketch
  super.stop();
}

class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;

  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }

  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }

  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }


void keyPressed() { 
  if (key == 'R' || key == 'r') {  // Press R to save the file 
    record = true; 
  }
  
}
}


