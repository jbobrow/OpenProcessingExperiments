
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatSensor sense;
PImage albumCover;
PFont font;
float bass;
float mids; 
float highs;

void setup() {
  size(1000, 450, P3D);
  //Audio and image files
  minim = new Minim(this);
  song = minim.loadFile("Avicii - X You (Radio Edit).mp3", 2048);
  song.play();
  albumCover = loadImage("AVICIIXYOU.JPG");
  font = loadFont("WaltographUI-Bold-29.vlw");
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  sense = new BeatSensor(beat, song);  
}

void draw() {
  background(0);
  fill(250);

  //Displays song name and artist.
  textFont(font, 14);
  text("X You", 800, 350);
  text("Avicii", 800, 380);
  
  //Detect spectrum of sound and set height of corresponding bar 
  if (beat.isKick() ) {
    bass = -200;
  }
  if (beat.isSnare()) { 
    mids = -200;
  }
  if (beat.isHat()) {
    highs = -200;
  }
  
  //Color change
  if (bass > mids || bass > highs ) {
    fill (17,220,245);
  } else if (bass < mids || bass < highs){
    fill (193,0,0);
  } else {
    fill (255,248,28);
  } 

  //Creation of bars
  rect(100,300,60,bass);
  rect(250,300,60,mids);
  rect(400,300,60,highs);
  bass = bass * 0.88;
  mids = mids * 0.88;
  highs = highs * 0.88;
  
  //Placement of song album cover 
  image(albumCover, 700, 0);

  //'Play' and 'Pause' buttons 
  if (!song.isPlaying()) {
    //'Play' button
    fill(250);
    triangle(710, 380, 710, 340, 750, 360);
    smooth();
  } 
  else {
    //'Pause' button
    fill(250);
    beginShape();
    vertex(710, 340);
    vertex(710, 380);
    vertex(725, 380);
    vertex(725, 340);
    vertex(735, 340);
    vertex(735, 380);
    vertex(750, 380);
    vertex(750, 340);
    endShape();
  }
}

//Operational keys
void keyPressed() {
  //'Play' switch
  if ( key == ENTER || key == RETURN) {
    song.play();
  }
  //'Pause' switch
  if ( key == ' ' ) {
    song.pause();
  }
  //'Loop' switch; loops or restarts the current song from the beginning
  if ( keyCode == LEFT ) {
    song.loop();
  }
  //Stops audio and closes window
  if (key == ESC) {
    exit();
  }
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



