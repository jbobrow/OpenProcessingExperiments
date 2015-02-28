
import processing.opengl.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatSensor sense;
Pillar myPillar;

float bass;
float mids;
float highs;
float ang = 0.0;
int framestep = 0;
int randX;
int randY;
int randSize;
int randNeg;
int pillarDepth = 12;

boolean sketchFullScreen() {
  return false;
}

void setup()
{
  frameRate(10);
  size(1024, 768, P3D);
  minim = new Minim(this);
  song = minim.loadFile("16 - Snake Ionics.mp3", 2048);
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  sense = new BeatSensor(beat, song);  
  song.play(); 
  myPillar = new Pillar(50, 100, 500);
}

void draw()
{
  float mouseYpos = mouseY;
  
  background(0, 0, 0);
  translate(width/2, height/2, (-100 - 1000*(mouseYpos/height)));
  rotateX(-PI/8 + 100 + .6*(mouseYpos/height));
  rotateY(ang); 
  stroke(255);
  strokeWeight(5);
  fill(0, 0, 0);
  translate(0, -60, 0);
  box(1000, 60, 1000);
  directionalLight(200, 126, 126, 0, 0, -1);
  ambientLight(200, 180, 50);
  
  drawPillar(randSize, randX, randY, pillarDepth);

  if (mouseX > (width*.8)) {
    ang+= (.1 * ((mouseX - width*.8)/width));
  }  
  if (mouseX < (width*.2)) {
    ang+= (.1 * ((mouseX - width*.2)/width));
  }

  if (beat.isKick() ) {
    bass = 290;
  } else { bass-= 30;}
  if (beat.isSnare()) {
    mids = 290;
  } else { mids-= 30;}
  if (beat.isHat()) {
    highs = 290;
  } else { highs-= 30;}
  
    if (bass == 290){
    randSize = int(random(20,100));
    randX = int(random(-400, 400));
    randY = int(random(-400, 400));
    framestep = 1;
  } else {framestep++;}
  
  camera();
  text(bass, 10, 10);
  text(mids, 10, 30);
  text(highs, 10, 50);
}

class BeatSensor implements AudioListener {

  private BeatDetect beat;
  private AudioPlayer song;

  BeatSensor(BeatDetect beat, AudioPlayer song) {
    this.song = song;
    this.song.addListener(this);
    this.beat = beat;
  }

  void samples(float[] s1) {
    beat.detect(song.mix);
  }

  void samples(float[] s2, float[] s3) {
    beat.detect(song.mix);
  }
}

void stop()
{
  // always close Minim audio classes when you are done with them
  song.close();
  minim.stop();

  super.stop();
}

void drawPillar(int randSize, int randX, int randY, int pillarDepth) {
    myPillar = new Pillar(randSize, randX, randY);
    myPillar.display();
    if (pillarDepth > 0){
      if (random(-1, 1) > 0){
      randNeg = 1;
      } else { randNeg = -1;}
      randX = int(randNeg*(.5*randSize));
      if (random(-1, 1) > 0){
      randNeg = 1;
      } else { randNeg = -1;}
      randY = int(randNeg*(.5*randSize));
      randSize = int(random(20, randSize));
      pillarDepth--;
      if(highs == 290){
      drawPillar(randSize, randX, randY, pillarDepth);
      }
    }
}

class Pillar {
  int pillarSize;
  int pillarX;
  int pillarY;

  Pillar(int pillarSizeTemp, int pillarXTemp, int pillarYTemp) {
    pillarSize = pillarSizeTemp;
    pillarX = pillarXTemp;
    pillarY = pillarYTemp;
  }

  void display() {
    fill(0);
    translate(pillarX, -pillarSize, pillarY);
    strokeWeight(2);
    box(pillarSize);
  }
} 


