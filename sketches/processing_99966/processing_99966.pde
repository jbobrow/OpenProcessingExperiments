
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatSensor sense;
PImage albumCover, albumCover2;
PFont font;
float bass;
float mids; 
float highs;
//Keeps track of the current song playing in the array
int currentTrack = 0;
//soundtrack will hold the audio files
String[] soundtrack = new String[2];{
soundtrack[0] = "Zedd - Clarity (feat. Foxes).mp3";
soundtrack[1] = "Avicii - Levels.mp3";
}

void setup() {
  size(1000, 450, P3D);
  //Audio and image files
  minim = new Minim(this);
  song = minim.loadFile(soundtrack[currentTrack], 2048);
  albumCover = loadImage("CLARITY.jpg");
  albumCover2 = loadImage("LEVELS.jpg");
  font = loadFont("WaltographUI-Bold-29.vlw");
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  sense = new BeatSensor(beat, song);  
}

void draw() {
  background(0);
  fill(250);

  //Displays controls
  textFont(font, 14);
  text("Controls:     'Play' - Enter/Return     'Pause' - Space     'Loop/Replay' - Shift     'Previous' - Left     'Next' - Right     'Exit' - Esc", 26, 445); 
  
  //Placement of song's album cover, title, and artist
  image(albumCover, 600, 5);
  text("1 - Clarity (feat. Foxes)", 790, 55);
  text("      Zedd",790, 85);
  image(albumCover2, 600, 175);
  text("2 - Levels", 790, 225);
  text("      Avicii",790, 255);

  //'Play' and 'Pause' buttons 
  if (song.isPlaying()) {
    //'Pause' button
    fill(250);
    beginShape();
    vertex(840, 340);
    vertex(840, 380);
    vertex(855, 380);
    vertex(855, 340);
    vertex(865, 340);
    vertex(865, 380);
    vertex(880, 380);
    vertex(880, 340);
    endShape();
  } else {
    //'Play' button
    fill(250);
    triangle(840, 380, 840, 340, 880, 360);
    smooth();
  } 
 
  //Detect spectrum of sound and set height of corresponding bar 
  if (beat.isKick() ) {
    bass = 290;
  }
  if (beat.isSnare()) { 
    mids = 290;
  }
  if (beat.isHat()) {
    highs = 290;
  }
  
  //Color change of bars
  if (bass > mids && bass > highs ) {
    fill (17,220,245);
  } else if (bass < highs && mids < highs){
    fill (193,0,0);
  } else {
    fill (255,248,28);
  }
  
  //Creation of bars for the specified spectrum of sound
  //Bass
  translate(142,200,0); 
  box(45,bass,45);
  //Mids
  translate(142,0,0); 
  box(45,mids,45);
  //Highs
  translate(142,0,0); 
  box(45,highs,45);
  
  //Delay
  bass = bass * 0.7;
  mids = mids * 0.7;
  highs = highs * 0.7;
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
  //'Loop/Replay' switch; loops or restarts the current song from the beginning
  if ( keyCode == SHIFT ) {
    song.loop();
  } 
  //'Previous' switch
  if (keyCode == LEFT) {
    song.close();
    if (currentTrack == 0) {
      currentTrack = soundtrack.length - 1;
    } else {
      currentTrack--;
    }
    song = minim.loadFile(soundtrack[currentTrack], 2048);
    song.play();  
    beat = new BeatDetect(song.bufferSize(), song.sampleRate());
    sense = new BeatSensor(beat, song); 
  }
  //'Next' switch
  if (keyCode == RIGHT) {
    song.close();
    if (currentTrack == soundtrack.length - 1) {
      currentTrack = 0;
    } else {
      currentTrack++;
    }
    song = minim.loadFile(soundtrack[currentTrack], 2048);
    song.play();  
    beat = new BeatDetect(song.bufferSize(), song.sampleRate());
    sense = new BeatSensor(beat, song);
  }
  //'Exit' switch
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

