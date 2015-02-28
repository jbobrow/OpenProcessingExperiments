
//Code edited by Dylan Mitchell-Funk

//Spacebar to play music

//mouse position determines box position and therefore what gets tiled

//click anywhere once, then hit m on the keyboard....

//pressing "m" tiles the image based on where the box was positioned, and
//and then changes to the music


// P_4_1_1_01.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/**
 * cutting and multiplying an area of the image
 * 
 * MOUSE
 * position x/y         : area position
 * left click           : multiply the area
 * 
 * KEYS
 * 1-3                  : area size
 * r                    : toggle random area
 * s                    : save png
 */
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

float kickSize, snareSize, hatSize, rotateKick, rotateSnare, rotateHat, speed, speedmax, opacity, opacitymax;
boolean playSwitch = false;
PImage img;

int tileCountX = 4;
int tileCountY = 4;
int tileCount = tileCountX*tileCountY;
PImage[] imageTiles = new PImage[tileCount];

int tileWidth, tileHeight;

int cropX = 0;
int cropY = 0;

boolean selectMode = true;
boolean randomMode = false; 


void setup() {
  size(600, 500); 
  img = loadImage("image.jpg");
  image(img, 0, 0);
  noCursor();

  minim = new Minim(this);

  song = minim.loadFile("04 Hover Traps.mp3", 512);

  // a beat detection object that is FREQ_ENERGY mode that 
  // expects buffers the length of song's buffer size
  // and samples captured at songs's sample rate
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  // set the sensitivity to 300 milliseconds
  // After a beat has been detected, the algorithm will wait for 300 milliseconds 
  // before allowing another beat to be reported. You can use this to dampen the 
  // algorithm if it is giving too many false-positives. The default value is 10, 
  // which is essentially no damping. If you try to set the sensitivity to a negative value, 
  // an error will be reported and it will be set to 10 instead. 

  beat.setSensitivity(100);
  kickSize = snareSize = hatSize = speed= opacity= 50;
  opacitymax=speedmax=255;

  // make a new beat listener, so that we won't miss any buffers for the analysis
  bl = new BeatListener(beat, song);


  tileWidth = width/tileCountY;
  tileHeight = height/tileCountX;
}


void draw() {
  

  

  if (!playSwitch) {
    song.pause();
  }
  if (playSwitch) {
    song.play();
  }
  if (beat.isKick()) {
    tileHeight =200;
    tileWidth = 200;
  }


  if (beat.isSnare()) {
    tileHeight--;
    tileWidth--;
  }

  if (beat.isHat()) {
    tileHeight-=20;
    tileWidth-=20;
  }

  if (selectMode == true) {
    // in selection mode, a white selection rectangle is drawn over the image
    cropX = constrain(mouseX, 0, width-tileWidth);
    cropY = constrain(mouseY, 0, height-tileHeight);    
    image(img, 0, 0);
    noFill();
    stroke(255);
    rect(cropX, cropY, tileWidth, tileHeight);
  } 
  else {
    // reassemble image
    int i = 0;
    for (int gridY = 0; gridY < tileCountY; gridY++) {
      for (int gridX = 0; gridX < tileCountX; gridX++) {
        image(imageTiles[i], gridX*tileWidth, gridY*tileHeight);
        i++;
      }
    }
  }
}



void cropTiles() {
  tileWidth = width/tileCountY;
  tileHeight = height/tileCountX;
  tileCount = tileCountX * tileCountY;
  imageTiles = new PImage[tileCount];




  int i = 0;
  for (int gridY = 0; gridY < tileCountY; gridY++) {
    for (int gridX = 0; gridX < tileCountX; gridX++) {
      if (randomMode) {
        cropX = (int) random(mouseX-tileWidth/2, mouseX+tileWidth/2);
        cropY = (int) random(mouseY-tileHeight/2, mouseY+tileHeight/2);
      }
      cropX = constrain(cropX, 0, width-tileWidth);
      cropY = constrain(cropY, 0, height-tileHeight);
      imageTiles[i++] = img.get(cropX, cropY, tileWidth, tileHeight);
    }
  }
}

void stop()
{
  // always close Minim audio classes when you are finished with them
  song.close();
  // always stop Minim before exiting
  minim.stop();
  // this closes the sketch
  super.stop();
}

void keyPressed() {
  if (key==' ') {
    if (!playSwitch) {
      playSwitch=true;
    }
    else if (playSwitch) {
      playSwitch=false;
    }
  }
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
} 





void mouseReleased() {
  selectMode = true; 
  cropTiles();
}

void mousePressed(){
  selectMode=false;
  cropTiles();
}







