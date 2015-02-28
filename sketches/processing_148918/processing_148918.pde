
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim; 
AudioPlayer player; 
FFT trans;

int xspacing = 8;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

PImage bg;

float max0, max1, max2, max3, max4, max5, max6, max7, max8, max9;
float map0, map1, map2, map3, map4, map5, map6, map7, map8, map9; 

int y;

float theta = 0.0f;       // Start angle at 0
float amplitude = 175.0f;  // Height of wave
float period = 500.0f;    // How many pixels before the wave repeats
float dx;                 // Value for incrementing X, to be calculated as a function of period and xspacing
float[] yvalues;          // Using an array to store height values for the wave (not entirely necessary)

void setup() {
  size(600, 600);
  colorMode(HSB);
  smooth();
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  println(yvalues.length);
  
  minim=new Minim(this); 
  player=minim.loadFile("noanoa.mp3");
  player.loop();
  trans = new FFT(player.bufferSize(), player.sampleRate()); 
  trans.linAverages(10);
  
  bg=loadImage("PM.jpg"); 
  
}

void draw() {
  background(bg);
  fill(255, 10);
  rect(0, 0, width, height);
  calcWave();
  renderWave();
  
  
  trans.forward(player.mix); 
  map0 = map(trans.getBand(0), 0, 9.80, width/2, width);
  map1 = map(trans.getBand(1), 0, 7.91, height/2, height);
  
  map2 = map(trans.getBand(2), 0, 19.47, 100, 255);//r
  map3 = map(trans.getBand(3), 0, 24.16, 0, 255 );  
  map4 = map(trans.getBand(4), 0, 32.45, 50, 255);//g
  
  map5 = map(trans.getBand(5), 0, 28.98, 200, 255);//b
  map6 = map(trans.getBand(6), 0, 22.23, 50, 300 );//17anios 
  map7 = map(trans.getBand(7), 0, 31.64, 30, 50 );//angeles
  
  map8 = map(trans.getBand(8), 0, 33.18, 80, 600 );
  map9 = map(trans.getBand(9), 0, 28, 150, 255);
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0 ; i <yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  // A simple way to draw the wave with an ellipse at each location
  for ( int x = 0; x < yvalues.length; x++ ) {
    stroke( x, map2, map3, map4);
    fill( yvalues[x], map5, map6, map7);
    ellipseMode( CENTER );
    ellipse( x*xspacing, width/2+yvalues[x], yvalues[(x+x)%77], yvalues[(x+x+x)%77] );
  }
  
  
   saveFrame("line-######.png"); 
}

