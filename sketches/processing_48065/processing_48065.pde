
/*
Modified by Alastair Gray. (Original by Jared "BlueThen" C,  'Wavy'.)
*/
 


 
float compression = .55;
float a;
float speed = 0.8;
 float nfr;
 float maxfr;
 import processing.opengl.*;
 int w = 200;
 int h = 200;
 float xm = w/2;
 float ym = h/2;
void setup()
{
 
  size(200,200);
  colorMode(HSB, 10);
 
  noCursor();
 
  //compression = (distance(mouseX,mouseY, w/500.0,ym/500.0)*compression++);
 
 
  stroke(2);
 
  frameRate(30);

  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16

  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out

  // set the portamento speed on the oscillator to 200 milliseconds
 
  // add the oscillator to the line out

  maxfr=frameRate;
}
void draw()
{

  speed = (xm-distance(mouseX,mouseY, xm,ym)) / (xm);
 
  // if (mouseX < w-100 > w-400, mouseY < h-100 > h-400){
 
  if ((mouseX < w -100)&&(mouseX > 100)) {
 
 
    compression = .88;
  }
  else {
    compression = .55;
  }
 
  compression = (xm-distance(mouseX,mouseY, xm,ym))/( distance(0,0, xm, ym));
 
 
 
 
  //When "i" is less than "35"...
 
 
 
  a -= speed;

  //background(6);
 noStroke();
  for (int x = -45; x < 45; x+=2) {
    //if (x > - 20) {
    // compression = .88;
 
 
    for (int z = -45; z < 45; z+=2) {
 
      //for (int y = int(10 * cos(0.55 * distance(x,z,0,0) - a))); halfw+halfh >= 250; int a -= 0.5;)  {    
 
 
      int y = int(24 * cos(compression * distance(x,z,0,0) - a));
 
 
 
 
 
      float xm = x*17 -8.5;
      float xt = x*17 +8.5;
      float zm = z*17 -8.5;
      float zt = z*17 +8.5;
 
      int halfw = mouseX;
      int halfh = mouseY;
 
 
      int isox1 = int(xm - zm + halfw);
      int isoy1 = int((xm + zm) * 0.5 + halfh);
      int isox2 = int(xm - zt + halfw);
      int isoy2 = int((xm + zt) * 0.5 + halfh);
      int isox3 = int(xt - zt + halfw);
      int isoy3 = int((xt + zt) * 0.5 + halfh);
      int isox4 = int(xt - zm + halfw);
      int isoy4 = int((xt + zm) * 0.5 + halfh);
 
      fill (2);
      quad(isox2, isoy2-y, isox3, isoy3-y, isox3, isoy3+40, isox2, isoy2+40);
      fill (4);
      quad(isox3, isoy3-y, isox4, isoy4-y, isox4, isoy4+40, isox3, isoy3+40);
 
 
      fill(4 + y * 0.05);
      quad(isox1, isoy1-y, isox2, isoy2-y, isox3, isoy3-y, isox4, isoy4-y);
    }
  }
  
  
   fill(6,2);
 rect(0,0,w,h);
}
 
 
 
 
float distance2(float x,float y,float cx,float cy) {
  return sqrt(sq(cx - x) + sq(cy - y));
}
 
void mouseMoved()
{
  // with portamento on the frequency will change smoothly
  float freq = (xm-distance(mouseX,mouseY, xm,ym));
 
 
  // pan always changes smoothly to avoid crackles getting into the signal
  // note that we could call setPan on out, instead of on sine
  // this would sound the same, but the waveforms in out would not reflect the panning
  float pan = (xm-distance(mouseX,mouseY, xm,ym));
 
}
 




//////////////

boolean fr = true;

PVector [] ka;
int wd;
int ht;
int _y1;
int _x1;
float distance(float ax,float b, float c,float d){

  if(fr){
    wd = width;
    ht = height;
    ka= new PVector [wd*ht];

    for (int i =0;i<wd*ht;i++){
      _y1 = int(i/wd);
      //ly = y;
      _x1  = i-(_y1*wd);
      float dis =dist(_x1,_y1,0,0);
      ka[i]=new PVector(dis,_x1,_y1);
    }
  }
  c =(c-ax);
  if (c<0)c=-c;
  d = (d-b);
  if (d<0)d=-d;

  ax=0;
  b=0;
  //    int dx=int(abs(c-ax));
  //    int dy=int(abs(d-b));
  //    c=c-dx;
  //    d=d-dy;
  float retval = 0;
  int pos = int(c)+wd*int(d);
  // retval = a.get(int(c),int(d))>>16&255;
  retval = ka[pos].x;
  fr = false;
  return retval;
}


//////////////////

