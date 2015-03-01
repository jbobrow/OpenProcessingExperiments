
/***************

  2014 October Metaglitch Collaboration
  Zoombeani
  Rev 21-Oct-2014
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
int otherFrames = 90;
int numFrames = inFrames + otherFrames + outFrames;

float t1 = inFrames * 1.0/numFrames;
float t2 = (inFrames+otherFrames) * 1.0/numFrames;

float p1=2.*t1,
      p2=.25*(t2-3.*t1)+p1,
      p3=.50*(t2-3.*t1)+p1,
      p4=.65*(t2-3.*t1)+p1,
      p5=t2-t1;

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
  
  background(255);
  fill(0);
 
  float x = 250;
  float y = 0;
    
  if (t<t1) {
    y = map(t, 0,t1, -50,50); // entry
    ellipse(x,y, 100,100); 
  } else if (t>=t1 && t<=t2) { 
    if(t<p1){
       float size=map(cos(map(t,t1,p1,0,PI/2.)),1,0,100,1);
       y=map(sin(map(t,t1,p1,0,PI/2.)),0,1,50,125);
       ellipse(250,y,size,size);
    } else if(t<p2){
      int n=3;
      for(float i=-n;i<=n;i++){
        for(float j=-n;j<=n;j++){
          for(float k=-n;k<=n;k++){
            float bul=map(sin(map(t,p1,p2,0,PI/2.)),0,1,0,1);
            float mul=.4;
            strokeWeight(map(cos(map(t,p1,p2,0,PI/2.)),1,0,1,4));
            stroke(0);
            pushMatrix();
            translate(width/2.,map(sin(map(t,p1,p2,0,PI/2.)),0,1,125,height/2.));
            point(map(i,-n,n,-bul*mul*width/2.,bul*mul*width/2.),map(j,-n,n,-bul*mul*height/2.,bul*mul*height/2.),map(k,-n,n,-bul*mul*height/2.,bul*mul*height/2.));
            popMatrix();
          }
        }
      }
    } else if(t<p3){
      int n=3;
      for(float i=-n;i<=n;i++){
        for(float j=-n;j<=n;j++){
          for(float k=-n;k<=n;k++){
            float bul=1.;
            float mul=.4;
            strokeWeight(4);
            stroke(0);
            pushMatrix();
            translate(width/2.,height/2.);
            rotate(map(cos(map(t,p2,p3,0,PI)),1,-1,0,-PI/6.));
            rotateY(atan(sin(map(cos(map(t,p2,p3,0,PI)),1,-1,0,PI/4.))));
            rotateX(map(cos(map(t,p2,p3,0,PI)),1,-1,0,PI/4.));
            point(map(i,-n,n,-bul*mul*width/2.,bul*mul*width/2.),map(j,-n,n,-bul*mul*height/2.,bul*mul*height/2.),map(k,-n,n,-bul*mul*height/2.,bul*mul*height/2.));
            popMatrix();
          }
        }
      }
    } else if(t<p4){
      int n=3;
      for(float i=-n;i<=n;i++){
        for(float j=-n;j<=n;j++){
          for(float k=-n;k<=n;k++){
            float bul=1.;
            float mul=.4;
            strokeWeight(4);
            stroke(0);
            pushMatrix();
            translate(width/2.,height/2.);
            rotate(-PI/6.);
            rotateY(atan(sin(PI/4.)));
            rotateX(PI/4.);
            //rotate(map(pow(t,3),p3,p5,0,6.*PI));
            point(map(i,-n,n,-bul*mul*width/2.,bul*mul*width/2.),map(j,-n,n,-bul*mul*height/2.,bul*mul*height/2.),map(k,-n,n,-bul*mul*height/2.,bul*mul*height/2.));
            popMatrix();
          }
        }
      }
    } else if(t<p5){
      int n=3;
      for(float i=-n;i<=n;i++){
        for(float j=-n;j<=n;j++){
          for(float k=-n;k<=n;k++){
            float bul=map(cos(map(t,p4,p5,0,PI/2.)),1,0,1,0);
            float mul=.4;
            strokeWeight(map(sin(map(t,p4,p5,0,PI/2.)),0,1,4,1));
            stroke(0);
            pushMatrix();
            translate(width/2.,map(cos(map(t,p4,p5,0,PI)),1,-1,height/2.,375));
            rotate(-PI/6.);
            rotateY(atan(sin(PI/4.)));
            rotateX(PI/4.);
            rotate(map(pow(map(t,p4,p5,0,1),3),0,1,0,6.*PI));
            point(map(i,-n,n,-bul*mul*width/2.,bul*mul*width/2.),map(j,-n,n,-bul*mul*height/2.,bul*mul*height/2.),map(k,-n,n,-bul*mul*height/2.,bul*mul*height/2.));
            popMatrix();
          }
        }
      }
    } else{
       float size=map(sin(map(t,p5,t2,0,PI/2.)),0,1,1,100);
       y=map(cos(map(t,p5,t2,0,PI/2.)),1,0,375,450);
       ellipse(250,y,size,size);
    }
  } else if (t>t2){
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
