
import processing.video.*;

Capture video;

int FIRESIZE = 256;
int FIRESIZE2 = FIRESIZE*FIRESIZE;
int FIREMASK = FIRESIZE2-1;


int [] flamebuf1 = new int [FIRESIZE2];
int [] flamebuf2 = new int [FIRESIZE2];

int [] flamesource = flamebuf1;
int [] flamedest = flamebuf2;

PImage img = new PImage(FIRESIZE, FIRESIZE);

int nframes = 60;//15;
PImage [] frames = new PImage[nframes];
int cframe = 0;


void swapFlameBuffer()
{
  int [] tmp = flamesource;
  flamesource = flamedest;
  flamedest = tmp; 
}

void flameCalc()
{
  swapFlameBuffer();
  
  img.loadPixels();
  
  
  for(int i=0; i<200; i++)
    flamesource[(int)random(FIRESIZE2)] = 200;
  
    
  for(int i=0; i<FIRESIZE*FIRESIZE; i++)
 {
   flamedest[i] = (flamesource[(i+1)&(FIREMASK)] + flamesource[i])>>1;
   img.pixels[i] = color(flamedest[i], 0, 0);
 } 
  
 img.updatePixels();
 
  
}



void setup() {
  int mscale = 2;
  size(640/mscale,480/mscale);//640, 480); // Change size to 320 x 240 if too slow at 640 x 480
  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, width, height, 60);
  
  for(int i=0; i<nframes; i++) frames[i] = new PImage(width, height);
  
  
  noStroke();
  smooth();
}


void draw()
{
  if (video.available()) {
    video.read();
   // image(video, 0, 0, width, height); // Draw the webcam video onto the screen
 
     cframe = cframe + 1;
     if(cframe>=nframes) cframe = 0;
     
     
     
//     video.loadPixels();
//     for(int i=0; i<width*height; i++)
//       frames[cframe].pixels[i] = video.pixels[i];
//     frames[cframe].updatePixels();
 
 
     frames[cframe].copy(video, 0,0, width, height, 0,0, width, height);
     frames[cframe].loadPixels();
 
 
   }
   
//   int swatchsize = 1;
//   for(int y=0; y<height; y+=swatchsize)
//   copy(frames[ ((int)(3*nframes+nframes*(0.5+0.40*sin(y*6.14/height))+cframe))%nframes]
//       , 0,y, width, swatchsize, 0,y, width, swatchsize);
   
    loadPixels();
    
    int p=0;
    for(int y=0; y<height; y++)
    for(int x=0; x<width; x++)
    {
      int f = (int)(4*nframes+ cframe+0.5*nframes+  nframes*0.50*cos(6.28*x/width)*cos(6.28*y/height) )%nframes;
      //print("f=" + f + "  p=" +p);
      pixels[p]=frames[f].pixels[p];
      
      p++;
    }
    updatePixels();
   
//   stroke(255);
//   color(255,0,0);
//   for(int y=0; y<height; y+=swatchsize)
//   {
//     line(0,y-1, 20+20*sin(y*6.14/height),y-1);
//   } 
     
   
   //flameCalc();
   //image(img, 0, 0, width, height);
   
   
   
}

