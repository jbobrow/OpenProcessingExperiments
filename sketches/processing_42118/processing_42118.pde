
//declaring images
PImage a1;
PImage a2; 
PImage a2m; 
PImage a3; 
PImage a3m; 
PImage a4; 
PImage a4m; 
PImage a5; 
PImage a5m; 
PImage a6;
PImage a6m; 
PImage a10a; 
PImage a11a;
PImage a12a; 
PImage b1;  
PImage b2; 
PImage b3; 
PImage b4; 
PImage b5; 

//declaring time
int s; 
int m; 
int h; 
//additional variables  
PImage mchange; 
PImage hchange; 

void setup () { 
  size (750, 750); 
  background (200); 
  smooth (); 
  //loading images
  a1 = loadImage ("novlayer1.gif"); 
  a2 = loadImage ("novlayer2.gif"); 
  a2m = loadImage ("novlayermask2inv.gif");
  a3 = loadImage ("novlayer3.gif"); 
  a3m = loadImage ("novlayer3mask.gif"); 
  a4 = loadImage ("novlayer4.gif"); 
  a4m = loadImage ("novlayer4mask.gif"); 
  a5 = loadImage ("novlayer5.jpg"); 
  a5m = loadImage ("novlayer5mask.gif"); 
  a6 = loadImage ("novlayer6.gif"); 
  a6m = loadImage ("novlayer6mask.gif");
  a10a = loadImage ("novlayeralt10.jpg"); 
  a11a = loadImage ("novlayeralt11.jpg"); 
  a12a = loadImage ("novlayeralt13.jpg"); 
  b1 = loadImage ("violet.jpg"); 
  b2 = loadImage ("red.jpg"); 
  b3 = loadImage ("orange.jpg"); 
  b4 = loadImage ("lightblue.jpg"); 
  b5 = loadImage ("realightblue.jpg"); 
  //declaring time 
  s = second (); 
  m = minute(); 
  h = hour();
  mchange = a1;
  hchange = b1; 
} 

void draw () { 
  //declaring time
  s = second (); 
  m = minute(); 
  h = hour();
  //changing hue based on hour 
  if (h <= 6) { 
    hchange = b1;
  }
  else if (h <= 7) {
    hchange = b2;
  }
  else if (h <= 8) {
    hchange = b3;
  }
  else if (h <= 18) {
    hchange = b4;
  }
  else if (h <= 19) {
    hchange = b3;
  }
  else if (h <= 20) {
    hchange = b2;
  }
  else if (h <= 24) {
    hchange = b1;
  }
  
  //changing background based on minute 
  if (m <= 14) { 
    mchange = a1;
  }
  else if (m <= 29) {
    mchange = a10a;
  }
  else if (m <= 44) {
    mchange = a11a;
  }
  else if (m <= 59) {
    mchange = a12a;
  }
  //creating masks 
  a2.mask (a2m); 
  a3.mask (a3m); 
  a4.mask (a4m); 
  a5.mask (a5m); 
  a6.mask (a6m); 
  //creating background rotation
  tint (s*25.5, 255); 
  image (mchange, 0, 0);
  //creating images
  tint (100+s, 150+s, 50+s); 
  tint (-205+s*25.5, 255); 
  image (a2, 0, 0);
  tint (-460+s*25.5, 255);
  image (a3, 0, 0);
  tint (-715+s*25.5, -510+s*25.5);
  image (a4, 0, 0);
  //hour hue overlays
  tint (255, 40); 
  image (hchange, 0, 0); 
  //creating flower overlays
  tint (-970+s*25.5, -970+s*25.5);
  filter (BLUR, -16+s/2.5);
  image (a5, 0, 0);
  tint (-1225+s*25.5, -1225+s*25.5); 
  filter (BLUR, -20+s/2.5);
  image (a6, 0, 0);
  tint (40, -3360+s*60);
  image (b4, 0, 0);
} 


