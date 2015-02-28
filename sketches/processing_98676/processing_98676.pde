
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

boolean debug = true;
float easing = 0.5f;

// laugh track
import ddf.minim.*;
AudioPlayer player;
Minim minim;//audio context

// Microphone input

import krister.Ess.*;

int bufferSize;
int steps;
float limitDiff;
int numAverages=1;
float myDamp=.1f;
float maxLimit,minLimit;

FFT myFFT;
krister.Ess.AudioInput myInput;

int wakeCounter = 0;
int wakeHysteresis = 2;
float wakeThreshold = 0.001f;
boolean awake = false;

// Pixel loop variables
  int loc;
  int screenloc;
  color current;
  color previous;
  float r1, r2, g1, g2, b1, b2;
  float diff;

// Example 16-13: Simple motion detection

import processing.video.*;
import gifAnimation.*;
// Variable for capture device
Capture video;
// Previous Frame
PImage prevFrame;

// Images
//PImage background;
Gif lips;

Gif fur;

PImage irissrc1;
PImage iris1;
PImage mask1;
PImage lid1;
PImage[] blink1;

PImage irissrc2;
PImage iris2;
PImage mask2;
PImage lid2;
PImage[] blink2;

PImage irissrc3;
PImage iris3;
PImage mask3;
PImage lid3;
PImage[] blink3;

PImage irissrc4;
PImage iris4;
PImage mask4;
PImage lid4;
PImage[] blink4;

PImage irissrc5;
PImage iris5;
PImage mask5;
PImage[] blink5;

PImage irissrc6;
PImage iris6;
PImage mask6;
PImage lid6;
PImage[] blink6;

PImage irissrc7;
PImage iris7;
PImage mask7;
PImage lid7;
PImage[] blink7;

PImage irissrc8;
PImage iris8;
PImage mask8;
PImage lid8;
PImage[] blink8;

PImage irissrc9;
PImage iris9;
PImage mask9;
PImage lid9;
PImage[] blink9;
int blinkFrameNum = 4; // max blink frames: 5

// How different must a pixel be to be a "motion" pixel
float threshold = 50;

float xsum = 0;
float xcount = 0;
float ysum = 0;
float ycount = 0;
int xaverage = 0;
int yaverage = 0;

int xoffset = 0;
int yoffset = 0;

int xoffset1 = 0;
int yoffset1 = 0;

int xoffset2 = 0;
int yoffset2 = 0;

int xoffset3 = 0;
int yoffset3 = 0;

int xoffset4 = 0;
int yoffset4 = 0;

int xoffset5 = 0;
int yoffset5 = 0;

//boolean sketchFullScreen() {
//  return true;
//}

void setup() {
  // laugh track
  minim = new Minim(this);
  player = minim.loadFile("laughing track.mp3", 1024);

  // Begin microphone input
  // start up Ess
  Ess.start(this);  

  // set up our AudioInput
  bufferSize=512;
  myInput=new krister.Ess.AudioInput(bufferSize);

  // set up our FFT
  myFFT=new FFT(bufferSize*2);
  myFFT.equalizer(true);

  // set up our FFT normalization/dampening
  minLimit=.005;
  maxLimit=.05;
  myFFT.limits(minLimit,maxLimit);
  myFFT.damp(myDamp);
  myFFT.averages(numAverages);

  // get the number of bins per average 
  steps=bufferSize/numAverages;

  // get the distance of travel between minimum and maximum limits
  limitDiff=maxLimit-minLimit;

  myInput.start();
  
  // End microphone input
  
  smooth(2);
  size(1920,1080);
  video = new Capture(this, 320, 240);
  video.start();
  // Create an empty image the same size as the video
  prevFrame = createImage(video.width,video.height,RGB);
  
  //background = loadImage( "Background/BG - HSB - 263c49.png" );
  //background.resize(width, height);
  
  lips = new Gif(this, "Lips/Lips-Moving.gif");
  lips.play();
  //lips.resize(width, height);
  
  fur = new Gif(this, "Fur-gif2.gif");
  fur.play();
  
  irissrc1 = loadImage( "E1/1.png" );
  //irissrc1.resize(width, height);
  iris1 = loadImage( "E1/1.png" );
  //iris1.resize(width, height);
  mask1 = loadImage( "E1/2.png" );
  //mask1.resize(width, height);
  lid1 = loadImage( "E1/3.png" );
  //lid1.resize(width, height);
  blink1 = new PImage[]{loadImage("E1/E1 Animation/01.png"),loadImage("E1/E1 Animation/02.png"),loadImage("E1/E1 Animation/03.png"),loadImage("E1/E1 Animation/04.png"),loadImage("E1/E1 Animation/05.png")};
  
  irissrc2 = loadImage( "E2/1.png" );
  //irissrc2.resize(width, height);
  iris2 = loadImage( "E2/1.png" );
  //iris2.resize(width, height);
  mask2 = loadImage( "E2/2.png" );
  //mask2.resize(width, height);
  lid2 = loadImage( "E2/3.png" );
  //lid2.resize(width, height);
  blink2 = new PImage[]{loadImage("E2/E2 Animation/01.png"),loadImage("E2/E2 Animation/02.png"),loadImage("E2/E2 Animation/03.png"),loadImage("E2/E2 Animation/04.png"),loadImage("E2/E2 Animation/05.png")};
  
  irissrc3 = loadImage( "E3/1.png" );
  //irissrc3.resize(width, height);
  iris3 = loadImage( "E3/1.png" );
  //iris3.resize(width, height);
  mask3 = loadImage( "E3/2.png" );
  //mask3.resize(width, height);
  lid3 = loadImage( "E3/3.png" );
  //lid3.resize(width, height);
  blink3 = new PImage[]{loadImage("E3/E3 Animation/01.png"),loadImage("E3/E3 Animation/02.png"),loadImage("E3/E3 Animation/03.png"),loadImage("E3/E3 Animation/04.png"),loadImage("E3/E3 Animation/05.png")};
  
  irissrc4 = loadImage( "E4/1.png" );
  //irissrc4.resize(width, height);
  iris4 = loadImage( "E4/1.png" );
  //iris4.resize(width, height);
  mask4 = loadImage( "E4/2.png" );
  //mask4.resize(width, height);
  lid4 = loadImage( "E4/3.png" );
  //lid4.resize(width, height);
  blink4 = new PImage[]{loadImage("E4/E4 Animation/01.png"),loadImage("E4/E4 Animation/02.png"),loadImage("E4/E4 Animation/03.png"),loadImage("E4/E4 Animation/04.png"),loadImage("E4/E4 Animation/05.png")};
  
  irissrc5 = loadImage( "E5/1.png" );
  //irissrc5.resize(width, height);
  iris5 = loadImage( "E5/1.png" );
  //iris5.resize(width, height);
  mask5 = loadImage( "E5/2.png" );
  //mask5.resize(width, height);
  //lid5 = loadImage( "E5/4.png" );
  //lid5.resize(width, height);
  blink5 = new PImage[]{loadImage("E5/E5 Animation/01.png"),loadImage("E5/E5 Animation/02.png"),loadImage("E5/E5 Animation/03.png"),loadImage("E5/E5 Animation/04.png"),loadImage("E5/E5 Animation/05.png")};
  
  irissrc6 = loadImage( "E6/1.png" );
  //irissrc6.resize(width, height);
  iris6 = loadImage( "E6/1.png" );
  //iris6.resize(width, height);
  mask6 = loadImage( "E6/2.png" );
  //mask6.resize(width, height);
  lid6 = loadImage( "E6/4.png" );  //TODO: merge 3.png in
  //lid6.resize(width, height);
  blink6 = new PImage[]{loadImage("E6/E6 Animation/01.png"),loadImage("E6/E6 Animation/02.png"),loadImage("E6/E6 Animation/03.png"),loadImage("E6/E6 Animation/04.png"),loadImage("E6/E6 Animation/05.png")};
  
  irissrc7 = loadImage( "E7/1.png" );
  //irissrc7.resize(width, height);
  iris7 = loadImage( "E7/1.png" );
  //iris7.resize(width, height);
  mask7 = loadImage( "E7/3.png" );
  //mask7.resize(width, height);
  lid7 = loadImage( "E7/4.png" ); //TOOD: merge 2.png in
  //lid7.resize(width, height);
  blink7 = new PImage[]{loadImage("E7/E7 Animation/01.png"),loadImage("E7/E7 Animation/02.png"),loadImage("E7/E7 Animation/03.png"),loadImage("E7/E7 Animation/04.png"),loadImage("E7/E7 Animation/05.png")};
  
  irissrc8 = loadImage( "E8/1.png" );
  //irissrc8.resize(width, height);
  iris8 = loadImage( "E8/1.png" );
  //iris8.resize(width, height);
  mask8 = loadImage( "E8/3.png" );
  //mask8.resize(width, height);
  lid8 = loadImage( "E8/4.png" );
  //lid8.resize(width, height);
  blink8 = new PImage[]{loadImage("E8/E8 Animation/01.png"),loadImage("E8/E8 Animation/02.png"),loadImage("E8/E8 Animation/03.png"),loadImage("E8/E8 Animation/04.png"),loadImage("E8/E8 Animation/05.png")};
  
  irissrc9 = loadImage( "E9/1.png" );
  //irissrc9.resize(width, height);
  iris9 = loadImage( "E9/1.png" );
  //iris9.resize(width, height);
  mask9 = loadImage( "E9/3.png" );
  //mask9.resize(width, height);
  lid9 = loadImage( "E9/4.png" );  //
  //lid9.resize(width, height);
  blink9 = new PImage[]{loadImage("E9/E9 Animation/01.png"),loadImage("E9/E9 Animation/02.png"),loadImage("E9/E9 Animation/03.png"),loadImage("E9/E9 Animation/04.png"),loadImage("E9/E9 Animation/05.png")};
  //blink9.noLoop();
  //blink9.ignoreRepeat();
  //blink9.play();
}

void draw() {
  //background(38,60,73); //background);
  
  image(fur,0,0);

  iris1.copy(irissrc1, 0, 0, iris1.width, iris1.height, xoffset1, yoffset1, iris1.width, iris1.height); 
  iris2.copy(irissrc2, 0, 0, iris2.width, iris2.height, xoffset, yoffset, iris2.width, iris2.height); 
  iris3.copy(irissrc3, 0, 0, iris3.width, iris3.height, xoffset, yoffset, iris3.width, iris3.height); 
  iris4.copy(irissrc4, 0, 0, iris4.width, iris4.height, xoffset, yoffset, iris4.width, iris4.height); 
  iris5.copy(irissrc5, 0, 0, iris5.width, iris5.height, xoffset1, yoffset1, iris5.width, iris5.height); 
  iris6.copy(irissrc6, 0, 0, iris6.width, iris6.height, xoffset1, yoffset1, iris6.width, iris6.height); 
  iris7.copy(irissrc7, 0, 0, iris7.width, iris7.height, xoffset2, yoffset2, iris7.width, iris7.height); 
  iris8.copy(irissrc8, 0, 0, iris8.width, iris8.height, xoffset3, yoffset3, iris8.width, iris8.height); 
  iris9.copy(irissrc9, 0, 0, iris9.width, iris9.height, xoffset4, yoffset4, iris9.width, iris9.height); 
  
  iris1.mask(mask1);
  image(iris1,758,135);
  image(lid1,758,135);
  image(blink1[blinkFrameNum],758,135);
  
  iris2.mask(mask2);
  image(iris2,250,0);
  image(lid2,250,0);
  image(blink2[blinkFrameNum],250,0);
  
  iris3.mask(mask3);
  image(iris3,26,146);
  image(lid3,26,146);
  image(blink3[blinkFrameNum],26,146);
  
  iris4.mask(mask4);
  image(iris4,90,199);
  image(lid4,90,199);
  image(blink4[blinkFrameNum],90,199);
  
  iris5.mask(mask5);
  image(iris5,600,0);
  //image(lid5,0,-1);
  image(blink5[blinkFrameNum],600,0);
  
  iris6.mask(mask6);
  image(iris6,1085,429);
  image(lid6,1085,429);
  image(blink6[blinkFrameNum],1085,429);
  
  iris7.mask(mask7);
  image(iris7,1226,191);
  image(lid7,1226,191);
  image(blink7[blinkFrameNum],1226,191);
  
  iris8.mask(mask8);
  image(iris8,1052,27);
  image(lid8,1052,27);
  image(blink8[blinkFrameNum],1052,27);
  
  iris9.mask(mask9);
  image(iris9,345,290);
  image(lid9,345,290);
  image(blink9[blinkFrameNum],345,290);
  
  image(lips,50,600);
  
  // Capture video
  if (video.available()) {
    // Save previous frame for motion detection!!
    prevFrame.copy(video,0,0,video.width,video.height,0,0,video.width,video.height); // Before we read the new frame, we always save the previous frame for comparison!
    prevFrame.updatePixels();
    video.read();
  }
  
  loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();
  
  // Begin loop to walk through every OTHER pixel
  for (int x = 0; x < video.width-1; x = x+2 ) {
    for (int y = 0; y < video.height-1; y = y+2 ) {
      
      loc = x + y*video.width;            // Step 1, what is the 1D pixel location
      current = video.pixels[loc];      // Step 2, what is the current color
      previous = prevFrame.pixels[loc]; // Step 3, what is the previous color
      
      // Step 4, compare colors (previous vs. current)
      r1 = red(current); 
      g1 = green(current); 
      b1 = blue(current);
      r2 = red(previous); 
      g2 = green(previous); 
      b2 = blue(previous);
      diff = dist(r1,g1,b1,r2,g2,b2);
      
      // Step 5, How different are the colors?
      // If the color at that pixel has changed, then there is motion at that pixel.
      if (diff > threshold) {
        
        //DEBUG: show webcam onscreen:
       if(debug){ 
         screenloc =  video.width-(x/2)-1 + (y/2)*width;  // translate to a location onscreen so we can see
        pixels[screenloc] = color(0,0,0);
       }
        
        xsum += x;
        xcount++;
        ysum += y;
        ycount++;
        
      } 
    }
  }
  
  xaverage = parseInt(xaverage + (parseInt(((video.width-(xsum/xcount))/video.width)*width) - xaverage) * easing);
  yaverage = parseInt(yaverage + (parseInt(((ysum/xcount)/video.height)*height) - yaverage) * easing);
  xsum = 0;
  ysum = 0;
  xcount = 0;
  ycount = 0;
  
  if(awake){  
    xoffset = (xaverage-(width/2))/15;
    yoffset = (yaverage-(height/2))/15;
    
    xoffset1 = (xoffset+xoffset1)/2;
    yoffset1 = (yoffset+xoffset1)/2;
    
    xoffset2 = (xoffset1+xoffset2)/2;
    yoffset2 = (yoffset1+xoffset2)/2;
    
    xoffset3 = (xoffset2+xoffset3)/2;
    yoffset3 = (yoffset2+xoffset3)/2;
    
    xoffset4 = (xoffset3+xoffset4)/2;
    yoffset4 = (yoffset3+xoffset4)/2;
    
    //xoffset5 = (xoffset4+xoffset5)/2;
    //yoffset5 = (yoffset4+xoffset5)/2;
  }
  
  //println(xaverage-1 + (yaverage-1)*video.width);
  if(debug){
    showCrosshairs(0, 0, 255, 255, 255);
    showCrosshairs(xoffset, yoffset, 255, 0, 0);
    showCrosshairs(xoffset1, yoffset1, 0, 0, 255);
    showCrosshairs(xoffset2, yoffset2, 0, 255, 0);
    showCrosshairs(xoffset3, yoffset3, 255, 0, 255);
    showCrosshairs(xoffset4, yoffset4, 0, 255, 255);
    //showCrosshairs(xoffset5, yoffset5, 255, 255, 0);
  }
   updatePixels();
  

  if(debug){
    fill(255, 255, 255);
    text("Easing: "+easing,40,40);
    text("(press plus/minus keys to adjust eye easing speed)",40,60);
    
    text("SOUND VALUE:"+myFFT.averages[0],40,80);
    if(myFFT.averages[0] < wakeThreshold) {
      text("IS UNDER BY:"+(wakeThreshold - myFFT.averages[0]),40,100);
    }
    else {
      text("IS OVER BY:"+(wakeThreshold - myFFT.averages[0]),40,100);
    }
    text("THE WAKE THRESHOLD:"+(wakeThreshold),40,120);
    text("(press up/down arrows to adjust threshold)",40,140);
  }
  
  // Microphone input
  if(awake == false && myFFT.averages[0] < wakeThreshold){
    if(debug) {
      text("^",10,20);
    }
    wake();
  }
  else {
    if(awake == true && myFFT.averages[0] > wakeThreshold){
      if(debug) {
        text("-",10,20);
      }    
      sleep();
    }
    else {
      if(awake == false){
        if(debug) {
          text("v",10,20);
        }
      }
    }
  }
  
  
}
public void audioInputData(krister.Ess.AudioInput theInput) {
  myFFT.getSpectrum(myInput);
}
public void wake(){
  if(wakeCounter > wakeHysteresis){
    if(!awake){ // we're asleep, wake up
      if(blinkFrameNum > 0){
        blinkFrameNum--; // = (blinkFrameNum+1) % 3;
      }
      else { // we're awake now, make it hard to go to sleep
        awake = true;
        wakeHysteresis = 10;
        wakeCounter = 0;
        player.play();
        player.rewind();
      }
    }
  }
  else {
    wakeCounter++;
  }
}
public void sleep(){
  if(wakeCounter > wakeHysteresis){
    if(awake){ // we're awake, go to sleep
      if(blinkFrameNum < 4){ // max blink frames: 5
        blinkFrameNum++; // = (blinkFrameNum+1) % 3;
      }
      else {  // we're asleep now, make it easy to wake up.
        awake = false;
        wakeHysteresis = 2;
        wakeCounter = 0;
      }
    }
  }
  else {
    wakeCounter++;
  }
}
void keyPressed() {
  if (key == CODED) {
      if (keyCode == UP) {
        wakeThreshold = wakeThreshold+0.005f;
      } else if (keyCode == DOWN) {
        wakeThreshold = wakeThreshold-0.005f;
      } 
  }
  else if (key == 'd'){
    debug = !debug;
  }
  else if (key == '=' && easing < 0.9f){
    easing = easing+0.1f;
  }
  else if (key == '-' && easing > 0.1f){
    easing = easing-0.1f;
  }
}
void showCrosshairs(int xoffset, int yoffset, int r, int g, int b){
  xoffset = xoffset*2;
  yoffset = yoffset*2;
  pixels[xoffset+220 + (yoffset+220)*width] = color(r,g,b);
  pixels[xoffset+219 + (yoffset+220)*width] = color(r,g,b);
  pixels[xoffset+218 + (yoffset+220)*width] = color(r,g,b);
  pixels[xoffset+221 + (yoffset+220)*width] = color(r,g,b);
  pixels[xoffset+222 + (yoffset+220)*width] = color(r,g,b);
  pixels[xoffset+220 + (yoffset+219)*width] = color(r,g,b);
  pixels[xoffset+220 + (yoffset+218)*width] = color(r,g,b);
  pixels[xoffset+220 + (yoffset+221)*width] = color(r,g,b);
  pixels[xoffset+220 + (yoffset+222)*width] = color(r,g,b); 
}


//================================================================
//Ken Perlin's Improved Noise Algorithm
//See http://mrl.nyu.edu/~perlin/paper445.pdf
//================================================================
 
void arrow(int x, int y, float ang) {
  pushMatrix();
    translate(x, y);
    rotate(ang);
    //line(0, 0, 30, 0);
    //arc(175, 35, 50, 50, -PI / 6, PI / 6);
    beginShape();
    curveVertex(0, 0); // the first control point
    curveVertex(0, 0);
    curveVertex(30, 20);
    curveVertex(50, 50);
    curveVertex(70, 80);
    curveVertex(100, 100);
    endShape();
    translate(20, 0);
    //rotate(PI + 0.4);
    //line(0, 0, 5, 0);
    //rotate(-0.8);
    //line(0, 0, 5, 0);
  popMatrix();
}
int p[];

float newNoise(float x, float y, float z) {
  int X = floor(x) & 255;
  int Y = floor(y) & 255;
  int Z = floor(z) & 255;
  x -= floor(x);
  y -= floor(y);
  z -= floor(z);
  float u = fade(x);
  float v = fade(y);
  float w = fade(z);   
  int A = p[X]+Y;
  int AA = p[A]+Z;
  int AB = p[A+1]+Z;
  int B = p[X+1]+Y;
  int BA = p[B]+Z;
  int BB = p[B+1]+Z;
 
  return lerp2(w, lerp2(v, lerp2(u, grad(p[AA], x, y, z), grad(p[BA], x-1, y, z)),
       lerp2(u, grad(p[AB], x, y-1, z), grad(p[BB], x-1, y-1, z))),
       lerp2(v, lerp2(u, grad(p[AA+1], x, y, z-1), grad(p[BA+1], x-1, y, z-1)),
       lerp2(u, grad(p[AB+1], x, y-1, z-1), grad(p[BB+1], x-1, y-1, z-1))));
 }
 
 float fade(float t) {
   return ((t*6 - 15)*t + 10)*t*t*t;
 }
 
 float lerp2(float t, float a, float b) {
   return (b - a)*t + a;
 }
 
 float grad(int hash, float x, float y, float z) {
   int h = hash & 15;
   float u = h<8 ? x : y;
   float v = h<4 ? y : h==12||h==14 ? x : z;
   return ((h&1) == 0 ? u : -u) + ((h&2) == 0 ? v : -v);
 }



