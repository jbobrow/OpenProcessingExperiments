
/***************

  Space Knot Fork
  Matt Beauchamp
  Rev DD-MMM-YYYY
  Org 30-Oct-2014
  
  Note: Using Bees & Bombs/ Dave Whyte's render model "//~~~"

***************/

//~~~
int[][] result;
float t;

void setup() {
  setup_();
  result = new int[width*height][3];
}
 
void draw() {
  if (mode==0) {          //Fine tune with mouse
    t = mouseX*1.0/width;
    draw_();
  } else if(mode==1) {    //Preview animation loop
    draw_();              //(Implemented by Zoombeani,
    t+=0.0025;            //idea courtesy of metaglitch)
    if(t>1.){             //Larger step = faster animation
      t=0;
    }
  } else if(mode==2) {    //Preview animation loop with motion blur
    draw_();              //(Implemented by Zoombeani,
                          //idea courtesy of metaglitch)
                          //Larger step = faster animation
    for (int i=0; i<width*height; i++)
      for (int a=0; a<3; a++)
        result[i][a] = 0;
 
    for (int sa=0; sa<samplesPerFrame; sa++) {
      t = map(frameCount-1 + sa*shutterAngle/samplesPerFrame, 0, numFrames, 0, 1.);
      draw_();
      loadPixels();
      for (int i=0; i<pixels.length; i++) {
        result[i][0] += pixels[i] >> 16 & 0xff;
        result[i][1] += pixels[i] >> 8 & 0xff;
        result[i][2] += pixels[i] & 0xff;
      }
    }
 
    loadPixels();
    for (int i=0; i<pixels.length; i++)
      pixels[i] = 0xff << 24 |
        int(result[i][0]*1.0/samplesPerFrame) << 16 | 
        int(result[i][1]*1.0/samplesPerFrame) << 8 | 
        int(result[i][2]*1.0/samplesPerFrame);
    updatePixels();
    if(t>=1.){
      frameCount=0;
    }
  } else {                //Render frames to gif
    for (int i=0; i<width*height; i++)
      for (int a=0; a<3; a++)
        result[i][a] = 0;
 
    for (int sa=0; sa<samplesPerFrame; sa++) {
      t = map(frameCount-1 + sa*shutterAngle/samplesPerFrame, 0, numFrames, 0, 1);
      draw_();
      loadPixels();
      for (int i=0; i<pixels.length; i++) {
        result[i][0] += pixels[i] >> 16 & 0xff;
        result[i][1] += pixels[i] >> 8 & 0xff;
        result[i][2] += pixels[i] & 0xff;
      }
    }
 
    loadPixels();
    for (int i=0; i<pixels.length; i++)
      pixels[i] = 0xff << 24 |
        int(result[i][0]*1.0/samplesPerFrame) << 16 | 
        int(result[i][1]*1.0/samplesPerFrame) << 8 | 
        int(result[i][2]*1.0/samplesPerFrame);
    updatePixels();
   
    saveFrame("f###.gif");
    if (frameCount==numFrames){
      exit();
    }
  }
}
 
int samplesPerFrame = 16;
int numFrames = 90;
float shutterAngle = 1.;

int mode = 1; //0  for fine tune with mouse
              //1  for preview animation
              //2  for preview animation with motion blur
              //3  for render to gif

boolean smooth_cam = false;
//boolean smooth_cam = true;
//~~~

//###Easing formulas
float ease1(float p) {            //courtesy of Bees & Bombs
  return 3*p*p - 2*p*p*p; 
}
float ease1(float p, float g) {   //courtesy of Bees & Bombs
  if (p < 0.5) 
    return 0.5 * pow(2*p, g); 
  else 
    return 1 - 0.5 * pow(2*(1 - p), g); 
}
float ease2(float t, float e) {   //courtesy of metaglitch
    return t<0.5? 0.5*pow(2*t, e) : 1 - 0.5*pow(2*(1 - t), e);  
}
                                  //courtesy of metaglitch
float ease2(float t, float in, float out) {
    return (1-t)*ease2(t, in) + t*ease2(t, out);  
}
//###

float x, y, z, tt;
float r = 180;
int N = 2400;
float d;
float th;

void setup_() {
  size(500,500,P3D);
  rectMode(CENTER);
  fill(32);
  noStroke();
  //ortho();
}

void draw_() {
  background(24); 
  pushMatrix();
  translate(width/2, height/2);
  rotateY(PI/2.);
  for(int i=0; i<N; i++){
    th = PI*2.*i/(N-1) + TWO_PI*t;
    d = map(cos(TWO_PI*i/(N-1)),1,-1,4,24);
    x = r*sin(2*th);
    y = .65*r*sin(3*th);
    z = 60*sin(11*th+HALF_PI);
    pushMatrix();
    translate(x,y,z);
    rotateY(-PI/2.);
    if(i<N/2.) fill(lerpColor(#00FF60,#0046FF,ease1(i/(.5*float(N)))));
    else fill(lerpColor(#0046FF,#00FF60,ease1(map(i/(float(N)),.5,1.,0,1))));
    ellipse(0,0,d,d);
    popMatrix();
  }
  popMatrix();
}
