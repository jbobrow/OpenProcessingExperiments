

import ddf.minim.analysis.*;
import ddf.minim.*;

PImage title;//image

Minim minim;//music library
AudioPlayer audioPlayer;
FFT fft;


float color1;//random color
int a = 0;
int b= 0;
float Xpos;
float Ypos;




void setup()
{
  size(500, 500);
  background(255);
  title = loadImage("Untitled-2-01.png");//background image
  image(title, 0, 0, 500, 500);
  noStroke();
  minim = new Minim(this);//song
  audioPlayer = minim.loadFile("16 Various Artists - Oh! Lovely Day.mp3", 512);
  audioPlayer.loop();
  fft = new FFT(audioPlayer.bufferSize(), audioPlayer.sampleRate());


  smooth();
}

void draw() {


  fill (random(150, 255), random(200, 255), random(200, 255));
  smooth();
  strokeWeight(0.1);
  stroke(color1, 100, 255, 180);//stroke color changes by mouse move
  color1= dist(mouseX, mouseY, Xpos, Ypos)/2;
  frameRate(14);

  beginShape();
  for (a=0;a<400;a++) {
    float r =noise((b)*0.7)*150*cos(a*0.7);
    curveVertex(250+r*sin(a+b*0.8), 250+r*cos(a+b*0.8));//flower shape
  }
  endShape();
  b++;
}
void stop()
{
  audioPlayer.close();
  minim.stop();
}


