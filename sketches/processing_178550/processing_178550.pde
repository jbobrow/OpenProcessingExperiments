
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;
int loopBegin, loopEnd;
boolean pause = false, mute=false; 
Mover m; 

void setup()
{
  size(896, 130);
  minim = new Minim(this);
  song = minim.loadFile("little_fang.mp3");
  song.loop();
  m = new Mover(); 
  fft = new FFT( song.bufferSize(), song.sampleRate() );
}

void draw()
{
  PImage image;
  image = loadImage("lee.png");
  image(image, 0, 0);

  m.update();
  m.edges();
  m.display();


  fft.forward( song.mix ); 
  for (int i = 0; i < fft.specSize (); i++) {
    fill(255, random(50, 150));
    ellipse( i*2, -fft.getBand(i)*2+height/2, 15, 15);
  }
}


void keyPressed()
{
  switch(key) {
  case 'f': // fast-forware
    song.skip(500); // fast-forward 500 milliseconds
    break;
  case 'r': // rewind
    song.skip(-500); // rewind 500 milliseconds
    break;

  case ' ':
    pause = !pause;
    if (pause) song.pause();
    else song.play();
    break;
  case 'm':
    mute = !mute;
    if (mute) song.mute();
    else song.unmute();
    break;
  }

  switch (keyCode) {
  case LEFT: // stereo Panning
    song.setPan( song.getPan()-0.1 );
    break;
  case RIGHT: // stereo Panning
    song.setPan( song.getPan()+0.1 );
    break;    
  case UP: // volume up
    song.setGain( song.getGain() + 1);
    break;
  case DOWN: // volume down
    song.setGain( song.getGain() - 1);
    break;
  }
}
class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;

  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void update() {

    int songLength = song.length(); 
    int p = song.position(); 
    float x = map(p, 0, songLength, 0, width);
    PVector cursor = new PVector (x, height/2);
    cursor.sub(location);
    cursor.setMag(1);
    acceleration = cursor;

    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(10);
  }

  void edges() {
    if (location.x > width) location.x =0;
    else if (location.x<0) location.x = width;
    if (location.y >height) location.y =0;
    else if (location.y <0) location.y = height;
  }

  void display() {
    noStroke();
    fill(255);
    ellipse (location.x, location.y, 32, 32);
    fill(255, 200);
    ellipse (location.x, location.y ,64, 64);
    fill(255, 100);
    ellipse (location.x, location.y, 128,128);

  }
}


