
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


//When running on the iPad or iPhone, you won't see anything unless you tap the screen.
//If it doesn't appear to work first time, always try refreshing the browser.

PImage echo; 

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer player;
FFT fftLog;

boolean starting = true;
boolean playing = false;
int mode = -1;

float go;
float maxPower = .55;
float minPower = .45;
float maxf1 = .55;
float maxf2 = .55;
float maxf3 = .55;
float maxf4 = .55;
float minf1 = .45;
float minf2 = .45;
float minf3 = .45;
float minf4 = .45;

void setup() {
  //The size is iPad Portrait.
  //If you want landscape, you should swap the values.
  size(768, 768, P2D); 
 
  echo = createImage(width, height, HSB);
  //imageMode(CENTER);
  
  frameRate(22); // this is the framerate. Tweak for performance

  minim = new Minim(this);
 
  player = minim.loadFile("Randy.wav");
  
  fftLog = new FFT(player.bufferSize(), player.sampleRate());
  // calculate averages based on a miminum octave width of 22 Hz
  // split each octave into two bands
  // this should result in 20 averages
  fftLog.logAverages(22, 2);

  //noStroke();
  //rectMode(CENTER);
  noFill();
  background(0);
  colorMode(HSB);
}

void draw() {

  if (starting) {
    pushStyle();
    stroke(255,255,255);
    textAlign(LEFT, TOP);
    textSize(23);
    text("Click to Start", 10, 30);
    text("Move to Change", 10, 60);
    text("Click for Modes", 10, 90);
    popStyle();
  }
  
  if (playing) {
    
    //float angleDelta = map(mouseX, 0, width, 90, 100);
    float angleDelta = map(mouseX, 0, width, PI/32, PI/2);
    float radiusDelta = map(mouseY, 0, width, .05, 5);
  
    float xDelta = 0;
    float yDelta = 0;
    float zDelta = 0;
  
    float p0Delta = 0;
    float p1Delta = 0;
    float wDelta = 0;
    float vDelta = 0;
  
    float f1 = 0;
    int i1 = 0;
    float f2 = 0;
    int i2 = 0;
    float f3 = 0;
    int i3 = 0;
    float f4 = 0;
  
    fftLog.forward(player.mix);
    i1 = fftLog.avgSize() / 4;
    i2 = 2 * i1;
    i3 = 3 * i1;
    float power = 0;  
    for(int i = 0; i < fftLog.avgSize(); i++) {
      power = power + fftLog.getAvg(i);
      if (i < i1) { f1 = f1+ fftLog.getAvg(i); }
      else {
        if ( i < i2) { f2 = f2 + fftLog.getAvg(i); }
        else {
          if ( i < i3) { f3 = f3 + fftLog.getAvg(i); }
          else { f4 = f4 + fftLog.getAvg(i); }
        }
      }        
    }
    
    power = power / fftLog.avgSize();
    
    if (frameCount <= 1){
        maxPower = power+1;
        minPower = power-1;
        maxf1 = f1+1;
        minf1 = f1-1;
        maxf2 = f2+1;
        minf2 = f2-1;
        maxf3 = f3+1;
        minf3 = f3-1;
        maxf4 = f4+1;
        minf4 = f4-1;
    }

    //go=power*2000;
    if (maxPower < power) { maxPower = power; }
    if (minPower > power) { minPower = power; }
         
    go = myMap(power,minPower,maxPower,0,255);
    
    if (maxf1 < f1) { maxf1 = f1; }
    if (maxf2 < f2) { maxf2 = f2; }
    if (maxf3 < f3) { maxf3 = f3; }
    if (maxf4 < f4) { maxf4 = f4; }
    if (minf1 > f1) { minf1 = f1; }
    if (minf2 > f2) { minf2 = f2; }
    if (minf3 > f3) { minf3 = f3; }
    if (minf4 > f4) { minf4 = f4; }

    xDelta = myMap(f1, minf1, maxf1, -.05, .05);
    zDelta = myMap(f2, minf2, maxf2, -.05, .05);
    yDelta = myMap(f3, minf3, maxf3, -.05, .05);
    
    p0Delta = p1Delta;
    p1Delta = myMap(f4, minf4, maxf4, -2, 7);
    wDelta = wDelta + p0Delta;
    vDelta = vDelta + p1Delta;
    
    translate((width/2+wDelta), (height/2+vDelta));
    strokeWeight(2);
    stroke((go)%255,255,255);
    
    if (frameCount <= 1){ 
      // do nothing 
    } else {
       background(0);
       //tint(#FEFEFE,254)
       tint(240);
       image(echo,-width/2,-height/2);  
    }
      
    //spiral(angleDelta+xDelta, radiusDelta+yDelta, xDelta, yDelta, width/2);
    spiralfill(angleDelta+zDelta, radiusDelta+zDelta, xDelta, yDelta, width/2, height/2);
    echo = get();    

  }

}

//This was used to verify the mapping behavior
float myMap(float v, float il, float ih, float ol, float oh) {
  float r = map(v,il,ih,ol,oh);
  //println(r + "<-" + v + "(" + il + " " + ih + " " + ol + " " + oh + ")");
  return r;
}

void mousePressed() {
  playing = true;
  starting = false;
  mode = (mode+1)%5;
  //println("Mode = " + mode);
  if (mode > 4) {
    player.pause();
    playing = false;
  }
  if (playing) {
    frameCount = 0;
    if (!player.isPlaying()) player.loop();
  } 
}

void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  minim.stop();
  super.stop();
}

void spiralfill(float angledelta, float radiusdelta, float xdelta, float ydelta, float fillX, float fillY) {
  float angle;
  float radius;
  float x, y, oldx, oldy, olderx, oldery, xoff, yoff;
  oldx = 0;
  oldy = 0;
  olderx = 0;
  oldery = 0;
  angle = 0;
  radius = 0;
  xoff = 0;
  yoff = 0;
  int itter = 0;
  while ((oldx <= fillX || oldy <= fillY) && itter < 500) {
    itter++;

    angle = angle + angledelta;
    radius = radius + (radiusdelta * 10);
    x = (radius * cos(angle)) + xoff;;
    y = (radius * sin(angle)) + yoff;

    if (mode == 0) {
      angle = angle + angledelta;
      radius = radius + radiusdelta;
      x = (radius * cos(angle)) + xoff;;
      y = (radius * sin(angle)) + yoff;
      line(oldx, oldy, x, y);
    }
    if (mode == 1) {
      angle = angle + angledelta;
      radius = radius + (radiusdelta * 7);
      x = (radius * cos(angle)) + xoff;;
      y = (radius * sin(angle)) + yoff;
      triangle(olderx, oldery, oldx, oldy, x, y);
    }
    if (mode == 2) {
      angle = angle + angledelta;
      radius = radius + radiusdelta;
      x = (radius * cos(angle)) + xoff;
      y = (radius * sin(angle)) + yoff;
      ellipse(oldx, oldy, x - oldy, y - oldx);
    }
    if (mode == 3) {
      angle = angle + angledelta;
      radius = radius + radiusdelta;
      x = (radius * cos(angle)) + xoff;
      y = (radius * sin(angle)) + yoff;
      if (abs(angle) > .01 && abs(radius) > 1) {
        ellipse(x, y, 500/angle, 5000/radius);
      }
    }
    if (mode == 4) {
      angle = angle + angledelta;
      radius = radius + radiusdelta;
      x = (radius * cos(angle)) + xoff;
      y = (radius * sin(angle)) + yoff;
      if (abs(1-abs(x-oldx)) > .1 && abs(1-abs(y-oldy)) > .1) {
        //println((x-oldx) + " " + (y-oldy));
        ellipse(x, y, 200/log(abs(x - oldx)), 200/log(abs(y - oldy)));
      }
    }
    
    olderx = oldx;
    oldery = oldy;
    oldx = x;
    oldy = y;
    xoff = xoff + xdelta;
    yoff = yoff + ydelta;
  }
  //println(itter);
}


