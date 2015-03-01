
// Original Code by @MetaGlitch
// edit by sarah h. (datenpinsel.tumblr.com)
// for #processingcollab

float fps = 16.666;

int inFrames = 15;
int outFrames = 15;
int otherFrames = 60;
int numFrames = inFrames + otherFrames + outFrames;

float t1 = inFrames * 1.0/numFrames;
float t2 = (inFrames+otherFrames) * 1.0/numFrames;

int samplesPerFrame = 8;
float exposure = 0.75; // exposure time in frames. >1 allowed for blending multiple frames
float subFrameAttenuation = 1; // 1 for weighting every subframe the same. <1 for attenuation effect.
boolean looping = true; // false: t=1 on the last frame; true: t=1-1/nummFrames on last frame.

boolean recording = true;

int numCicles = 10; 
float[] rand;
float size;

void setup_() {
  size(500, 500, P3D);
  smooth(8);
  noStroke();
  
  rand = new float[numCicles];
  
  
  for(int i = 0; i < numCicles; i++) {
    rand[i] = random(1);
  }
}

float exposureCopy = exposure;
void draw_() {
  // collab settings: hit t=1 and remove motion blur on first and last frame.
  looping = false; if (frameCount==1 || frameCount==numFrames) exposure=0; else exposure=exposureCopy;
  
  background(0);
  fill(255);

  float x = 250;
  float y = 0;
  
    
  //for(int i = 0; i < numCicles; i++) {
    if (t<t1) y = map(t, 0,t1, -50,50); // entry
    if (t>t2) y = map(t, t2,1, 450,550); // exit
    
    
    
    if (t>=t1 && t<=t2) {
      float tt = map(t, t1,t2, 0,1);
      y = map(t, t1,t2, 50,450);
      x = 250;
      
      size = 100+700*ease(pingpong(map(t, t1,t2, 0,1)),3);
      
      noStroke();
      ellipse(x,y, size, size);
      
      if(tt > 0.9 || tt < 0.1)
        stroke(128);
      else 
        stroke(0);
        
      strokeWeight(1-abs(tt-0.5));
      
      // minutes
      line(x,y,
        // (yeah i know the minutes:hours ratio technically isn't correct.. :>) 
        (x - cos(TAU/4 + 12 * tt*TAU) * size/2*0.8),
        (y - sin(TAU/4 + 12 * tt*TAU) * size/2*0.8));
        
      strokeWeight(10-abs(tt-0.5)*20);
      
      // hours
      line(x,y,
        (x - cos(TAU/4 + 5 * tt*TAU) * size/2*0.5),
        (y - sin(TAU/4 + 5 * tt*TAU) * size/2*0.5));
      
    } else {
      size = 100;
      ellipse(x,y, size, size);
    }
}

//////////////////

float pingpong(float t) { //  / => /\
  return 1-2*abs(t-0.5);
}

float ease(float t, float e) {
  return t < 0.5 ? 0.5 * pow(2*t, e) : 1 - 0.5 * pow(2*(1 - t), e);  
}

float ease(float t, float in, float out) {
  return (1-t)*ease(t, in) + t*ease(t, out);  
}

// Original Code by @MetaGlitch
// edit by sarah h. (datenpinsel.tumblr.com)
// for #processingcollab

float t;
float[][] result;

void setup() {
  setup_();
  result = new float[width*height][3];
}

void draw() {
  if (!recording) {
    if (mousePressed) {
      frameRate(60);
      t = mouseX*1.0/width;
      if (mouseButton == LEFT) t = constrain(t, 0, 1);
      while(t<0) t+=1.0;
      while(t>1) t-=1.0;
    } else {
      frameRate(fps);
      t = float((frameCount-1)%numFrames) / numFrames;
    }
    draw_();  
  } else { // sub frame rendering inspired by @beesandbombs
    for (int i=0; i<width*height; i++) for (int a=0; a<3; a++) result[i][a] = 0;

    float divider = 0; 
    for (int sa=0; sa<samplesPerFrame; sa++) {
      noLights(); // reset lights
      t = map(frameCount-1 + exposure*sa/samplesPerFrame, 0, numFrames - (looping?0:1) , 0, 1) % 1;
      pushMatrix();
      draw_();
      popMatrix();
      loadPixels();
      float weight = pow(subFrameAttenuation, samplesPerFrame-sa-1);
      divider += weight;
      for (int i=0; i<pixels.length; i++) {
        result[i][0] += weight * (pixels[i] >> 16 & 0xff);
        result[i][1] += weight * (pixels[i] >> 8 & 0xff);
        result[i][2] += weight * (pixels[i] & 0xff);
      }
    }
 
    loadPixels();
    for (int i=0; i<pixels.length; i++)
      pixels[i] = 0xff << 24 | 
        int(result[i][0]*1.0/divider) << 16 | 
        int(result[i][1]*1.0/divider) << 8 | 
        int(result[i][2]*1.0/divider);
    updatePixels();
 
    saveFrame("frames/f###.gif");
    if (frameCount==numFrames)
      exit();
  }
  
}



