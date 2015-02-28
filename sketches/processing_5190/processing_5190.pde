
//Majority of code thanks to Jim Bumgardner (KrazyDad) Whitney Column A


static float deg=PI/180; 
 
float stepstart = 0, 
      stepend = 1/60.0, 
      xleft = 0,  
      ybottom = 0; 
 
int iwidth=400, iheight=400; 
 
int  npoints = 60,  
     nframes = 30, 
     ilength = iwidth - 30; // 170; 
 
void setup() 
{ 
  size(iwidth, iwidth); 
  // framerate(10); 
  noStroke(); 
  fill(0,117,240); 
} 
 
void draw() 
{ 
  background(0); // erase 
  float ftime = millis()*.111; 
  float step = stepstart + (ftime * (stepend - stepstart)); 
 
  for (int point = 2; point < npoints; ++point) 
  { 
    float x = xleft + ilength * point/(float)npoints; 
    float y = ilength * point * step; 
    y = ybottom + ( Math.round(y) % ilength ); 
    ellipse((int) x, (int) y, 10, 10); 
    // set((int) x, (int) y, color(255)); 
  } 
} 
 


