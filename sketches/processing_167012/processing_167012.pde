


//By Shubhank Sahay
//Thanks to professor Kyle for teaching me to work with sound library

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.*;

Minim minim;
AudioPlayer player;
FFT fft;
Particle[] particles;

boolean blownAway = false;
int x;

void setup()
{
  size(900, 800);
  smooth();
  frameRate(25);
  background(255);
  colorMode(HSB, 360, 100, 100, 100);
  minim = new Minim (this);
  player = minim.loadFile ("Main Track.mp3", 512);
  player.loop();
  fft = new FFT (player.bufferSize(), player.sampleRate());
  particles = new Particle[ fft.specSize()];
  for (int i = 0; i<fft.specSize (); i++) {
    particles[i] = new Particle(i);
    //This Modifier here is suppose to make the drawing more reactive to the sketch but isn't really doing it.
    float modifier = player.left.get((x*50+x)%102)*50;
  }
}
void draw() {
  pushStyle();
  colorMode(RGB, 55);
  if (blownAway) {
    noStroke();
    fill( 0, 0);
    rect(0, 0, width, height);
  } else {
    background(0);
  }
  popStyle();
  fft.forward(player.mix);

  //Interactive Grid Display 
  int counter = frameCount;
  noStroke();
  for (int xPos = 0; xPos<900; xPos+=75) {
    for (int yPos = 0; yPos<800; yPos+=75) {
      float distance = dist(xPos, yPos, mouseX, mouseY);
      ////http://www.processing.org/reference/map_.html "Map reference"
      float sizeCirc = map(distance, 0, 700, 50, 0);

      ellipse(xPos+5, yPos, sizeCirc, sizeCirc+2);
    }
    //Circle Inspired from book Processing: A Programming Handbook for Visual Designers and Artists k
    fill( 25, 1 );
    noStroke();
    stroke(0);
    noFill();
    int k;
    float r = 1;
    for ( int i = 0; i < player.bufferSize (); i++ ) {
      r += abs( player.mix.get( i ) ) * 6;
    }
    ellipse( width/2, height/2, r, r );  

    //Particle Loop
    for ( int i = 0; i <fft.specSize () - 1; i++) {
      particles [i].update(fft.getBand(i), player.mix.get(i*2));
      particles[i].change();
    }
  }
}


//Press b to be blown away 
void keyPressed()
{
  if (key == 'b') {
    blownAway = !blownAway;
  }
}

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}
//Particle 
//http://www.processing.org/reference/map_.html "Map reference"
class Particle
{
  PVector Acceleration;
  PVector speed;

  float radius;
  float hue;
  float sat;
  float brite;

  Particle( int id)
  {
    Acceleration = new PVector( map( id, 0, fft.specSize(), 50, width), height/2);
    speed = new PVector (random(-3, 1), random(-3, 1));
    hue= map( id, 45, fft.specSize(), 0, 360 );
    sat = 200;
    brite= 200;
  }

  void update( float _r, float _b)
  {
    Acceleration.add(speed);
    if (Acceleration.x<0 || Acceleration.x >width) {
      speed.x *=-1;
    }

    if (Acceleration.y<15||Acceleration.y>height) {
      speed.y*=-1;
    }
    radius =_r;
    radius = constrain(radius, 2, 125);
    sat= map(_b, -1, 1, 25, 140);
  }

  void change()
    //change fills the particles with color and changes stroke
  {
    stroke(0, 155, 95, 100);
    fill(0, 0, 0, 65);
    ellipse(Acceleration.x, Acceleration.y, radius*3, radius*3);
  }
}



