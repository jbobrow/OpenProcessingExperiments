
/* Created by Anton Pugh */

/* Music Visualizer that samples the short-time fft of a song and */
/* plots the sampled points (|fft| => brightness of point).       */

// Note: If your machine has OpenGL capabilities, uncomment the
// following line and change 'P3D' to 'OPENGL' on line 34
//import processing.opengl.*;
import ddf.minim.analysis.*;
import ddf.minim.*;
//import fullscreen.*;

/* MAX_SPOTS is the maximum number of points the sketch can plot  */
/* NUM_ITERATIONS determines how often fft is sampled into points */
/*   - Higher number => less often
/*   - 1 == as often as possible
/* SPEED determines how fast points rotate                        */
int MAX_SPOTS = 1000000;
int NUM_ITERATIONS = 1;
float SPEED = 4;

// Declare a new Minim object which will allow us to play and
// analyze music. If you want to use the computer sound card
// output, leave code as is, otherwise comment out the AudioInput
// line and uncomment the AudioPlayer line. Additionally, you 
// will need to change how the sketch gets data, so look in
// the setup loop for song = minim.loadFile
Minim minim;
//AudioInput song;
AudioPlayer song;
FFT fft;
//SoftFullScreen fs;

Spot[] spots = new Spot[MAX_SPOTS];
int numSpots, index, colorSwitch;
color spotColor, barCol1, barCol2;
float band, rBar, gBar, bBar;

void setup() {
  // Set size of window and rendering mode
  // Note: If your machine has OpenGL capabilities, change
  // 'P3D' to 'OPENGL' and uncomment the first line
  size(800, 500, P3D);
                       
  minim = new Minim(this);
  //fs = new SoftFullScreen(this);
  
  //fs.enter();
  
  // 
  // MODIFY STRING TO CHANGE THE SONG THAT IS LOADED
  // (SONG MUST BE IN soundWaterfall/data/)
  song = minim.loadFile("annArborPart2.mp3", 512);
  song.loop();
  //song = minim.getLineIn(minim.MONO, 2048);
  
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.window(FFT.HAMMING);
  
  numSpots = 0;
  barCol1 = color(0,0,128,255);
  barCol2 = color(0,0,128,150);
  index = 0;
  colorSwitch = 0;
  rBar = 0;
  gBar = 0;
  bBar = 0;
}

void draw() {
  smooth();
  background(0);

  fft.forward(song.mix);
  for(int i = 0; i < 150; i+=2) {
    // GET MAGNITUDE OF FFT AT BAND i
    band = fft.getBand(i);
    spotColor = color(0,0,min(100*band,255));
    
    // Draw a bar for FFT Band i as well as a reflection of the bar
    stroke(barCol1);
    strokeWeight(4);
    line(width/30 + 5*i, 23*height/26,-width/10, width/30 + 5*i, 23*height/26 - 5*band,-width/10);
    stroke(barCol2);
    strokeWeight(3);
    line(width/30 + 5*i, 93*height/104, -width/10, width/30 + 5*i - 2*band, 93*height/104 + 2*band, band/15 - width/10);

    // Make a spot if the magnitude of the band is big enough
    if((numSpots < MAX_SPOTS) && (index == NUM_ITERATIONS) && (band > 1)) {
      spots[numSpots] = new Spot(5  *width/61 + 5*i, max(2*height/7,103*height/168 - int(4*band)), spotColor);
      numSpots++;
    }
  }
  
  // RESET INDEX IF IT'S TIME TO GET ANOTHER FFT SAMPLE
  if(index == NUM_ITERATIONS) {
    index = 0;
  }
  else {
    index++;
  }
  
  // Update the color and position of all spots
  for(int i=0; i < numSpots; i++) {
    spots[i].update();
    if(index == NUM_ITERATIONS) {
      spots[i].colorChange();
      rBar += spots[i].r;
      gBar += spots[i].g;
      bBar += spots[i].b;
    }
  }
  
  // Update the color of the bars
  if(index == NUM_ITERATIONS) {
    rBar = rBar/(numSpots - 1);
    gBar = gBar/(numSpots - 1);
    bBar = bBar/(numSpots - 1);
    barCol1 = color(rBar,gBar,bBar,255);
    barCol2 = color(rBar,gBar,bBar,150);
    rBar = 0;
    gBar = 0;
    bBar = 0;
  }
  
  if(numSpots > 80000) {
    numSpots -= 500;
    for(int i=0; i < numSpots; i++) {
      spots[i] = spots[i+499];
    }
  }
}

void stop() {
  song.close();
  minim.stop();
  
  super.stop();
}

void mousePressed() {
  numSpots = 0;
}

class Spot {
  int x,y,z;
  color c;
  float r, g, b;
  
  
  Spot(int tempX, int tempY, color tempC) {
    c = tempC;
    x = tempX;
    y = tempY;
    z = width/15;
    r = red(tempC);
    g = green(tempC);
    b = blue(tempC);
  }
  
  void update() {
    z -= SPEED/2;
    y += SPEED/20;
    
    stroke(c);
    strokeWeight(1);
    point(x,y,z);
    //line(y,12*height/21,x,y,z,x);
  }
  
  void colorChange() {
    if(b > 0 && g == 0) {
      colorSwitch = 0;
    }
    else if(r > 0 && b == 0) {
      colorSwitch = 1;
    }
    else if(g > 0 && r == 0) {
      colorSwitch = 2;
    }
    
    if(colorSwitch == 0) {
      r++;
      b--;
    }
    else if(colorSwitch == 1) {
      g++;
      r--;
    }
    else if(colorSwitch == 2) {
      b++;
      g--;
    }
    c = color(r,g,b,255);
  }
}
    

