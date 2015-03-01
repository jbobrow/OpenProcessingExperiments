
/***************
 
  2014 October Metaglitch Collaboration
  Zoombeani
  Rev 27-Oct-2014
  Org 20-Oct-2014
 
***************/
 
// Code by @MetaGlitch
 
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
 
// Code by @MetaGlitch
 
float fps = 16.666;
 
int inFrames = 15;
int outFrames = 15;
int otherFrames = 45;
int numFrames = inFrames + otherFrames + outFrames;
 
float t1 = inFrames * 1.0/numFrames;
float t2 = (inFrames+otherFrames) * 1.0/numFrames;
 
float p1=2.*t1,
      p2=.25*(t2-3.*t1)+p1,
      //p3=.65*(t2-3.*t1)+p1,
      //p4=.75*(t2-3.*t1)+p1,
      p5=t2-t1,
      tt,size;
 
int samplesPerFrame = 8;
float exposure = 0.75; // exposure time in frames. >1 allowed for blending multiple frames
float subFrameAttenuation = 1; // 1 for weighting every subframe the same. <1 for attenuation effect.
boolean looping = true; // false: t=1 on the last frame; true: t=1-1/nummFrames on last frame.
  
boolean recording = false;
  
void setup_() {
  size(500, 500, P3D);
  smooth(8);
  noStroke();
}
  
float exposureCopy = exposure;
void draw_() {
  // collab settings: hit t=1 and remove motion blur on first and last frame.
  looping = false; if (frameCount==1 || frameCount==numFrames) exposure=0; else exposure=exposureCopy;
  
  float x = 250;
  float y = 0;
     
  if (t<t1) {
    background(255);
    fill(0);
    y = map(t, 0,t1, -50,50); // entry
    ellipse(x,y, 100,100);
  } else if (t>=t1 && t<=t2) {
    if(t<p1){
      background(0);
      fill(255);
      size=map(cos(map(t,t1,p5,0,PI/2.)),1,0,500*sqrt(2)*1.2,100);
      y=map(sin(map(t,t1,p5,0,PI/2.)),0,1,250,375);
      ellipse(250,y,size,size);
      fill(0);
      size=map(cos(map(t,t1,p2,0,PI/2.)),1,0,100,0);
      y=map(cos(map(t,t1,p2,0,PI/2.)),1,0,50,250);
      ellipse(250,y,size,size);
      x=map(cos(map(t,t1,p2,0,PI/2.)),1,0,600,300);
      y=map(cos(map(t,t1,p2,0,PI/2.)),1,0,-100,250);
      ellipse(x,y,1.2*size,1.2*size);
      x=map(cos(map(t,t1,p2,0,PI/2.)),1,0,-150,175);
      y=map(cos(map(t,t1,p2,0,PI/2.)),1,0,600,400);
      ellipse(x,y,1.5*size,1.5*size);
       
    } else if(t<p2){
       
      background(0);
      fill(255);
      size=map(cos(map(t,t1,p5,0,PI/2.)),1,0,500*sqrt(2)*1.2,100);
      y=map(sin(map(t,t1,p5,0,PI/2.)),0,1,250,375);
      ellipse(250,y,size,size);
      fill(0);
      size=map(cos(map(t,t1,p2,0,PI/2.)),1,0,100,0);
      y=map(cos(map(t,t1,p2,0,PI/2.)),1,0,50,250);
      ellipse(250,y,size,size);
      x=map(cos(map(t,t1,p2,0,PI/2.)),1,0,600,300);
      y=map(cos(map(t,t1,p2,0,PI/2.)),1,0,-100,250);
      ellipse(x,y,1.2*size,1.2*size);
      x=map(cos(map(t,t1,p2,0,PI/2.)),1,0,-150,175);
      y=map(cos(map(t,t1,p2,0,PI/2.)),1,0,600,400);
      ellipse(x,y,1.5*size,1.5*size);
       
    //} else if(t<p3){
       
    //} else if(t<p4){
       
    } else if(t<p5){
      background(0);
      fill(255);
      size=map(cos(map(t,t1,p5,0,PI/2.)),1,0,500*sqrt(2)*1.2,100);
      y=map(sin(map(t,t1,p5,0,PI/2.)),0,1,250,375);
      ellipse(250,y,size,size);
       
    } else{
       background(0);
       fill(255);
       y=map(cos(map(t,p5,t2,0,PI/2.)),1,0,375,450);
       ellipse(250,y,100,100);
    }
     
  } else if (t>t2){
    background(0);
    fill(255); 
    y = map(t, t2,1, 450,550); // exit
    ellipse(x,y,100,100);
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
