
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
AudioInput input;
FFT fft;

float xPos, yPos;
float rad, rad2, rad3;
float oscillation, oscillation2, oscillation3;
PImage img;

void setup() {
  size(881, 616);
  smooth();
  //load background image
  //image source: http://www.stevebuffoni.com/
  img = loadImage("data/background.jpeg");

  minim=new Minim(this);
  song = minim.loadFile("data/sail.mp3", 512);
  fft = new FFT(song.bufferSize(), song.sampleRate());
  input = minim.getLineIn();
}


void draw() {

  image(img,0,0);

  song.play();

  for (int i = 0; i<song.bufferSize() - 1; i++) {
    stroke(random(0, 255), random(0, 255), random(0, 255));
    strokeWeight(3);
    fill(random(0, 255), random(0, 255), random(0, 255), 60);
    ellipse (width/2, height/2, 100- song.left.get(i)*400, 100-song.right.get(i+1)*400);
  }
  
//  pushMatrix();
//  translate(width/2,0);
//  for (int i = 0; i<song.bufferSize() - 1; i++) {
//    stroke(0);
//    strokeWeight(1);
//    fill(255);
//    ellipse (width/4, height/2, 100- song.left.get(i)*400, 100-song.right.get(i+1)*400);
//  }
  
 
}

void stop() {
  song.close();
  input.close();
  minim.stop();
  super.stop();
  noFill();
}


