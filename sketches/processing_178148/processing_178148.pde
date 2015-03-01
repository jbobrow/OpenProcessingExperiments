
// Code: adapted from http://www.neilwallis.com/java/water.html
// music in background: indigo iris cosmic energy creative commons 3.0
// water: from wave fx creative commons
// image: By Manco Capac (Own work) [CC BY-SA 3.0 (http://creativecommons.org/licenses/by-sa/3.0) or GFDL (http://www.gnu.org/copyleft/fdl.html)], via Wikimedia Commons


//this is comented for the javascript version 
//import ddf.minim.*;



//Minim minim;
//AudioPlayer energy;
//AudioPlayer wave;

PImage img;
 
int size;
int hwidth,hheight;
int riprad;
 
int ripplemap[];
int ripple[];
int texture[];
 
int oldind,newind, mapind;
 
int i,a,b;
 
void setup(){
  
   img = loadImage("https://db.tt/8VPnFYeT");
//  width = img.width;
//  height = img.height;
//  size(width, height);
   size(960, 720);
  frameRate(60);
//  minim = new Minim(this);
//  energy = minim.loadFile("data/energy.mp3"); 
//  energy.play();
  hwidth = width>>1;
  hheight = height>>1;
  riprad=5; //test with 3 5
   
  size = width * (height+2) * 2;
   
  ripplemap = new int[size];
  ripple = new int[width*height];
  texture = new int[width*height];
   
  oldind = width;
  newind = width * (height+3);
   
  image(img, 0, 0);
  loadPixels();
   
  smooth();
}
 
void draw() {
  image(img, 0, 0);
   
  loadPixels();
  texture = pixels;
   
  newframe();
     
  for (int i = 0; i < pixels.length; i++) {
    pixels[i] = ripple[i];
  }
    
  updatePixels();
}
 
public void disturb(int dx, int dy) {
  for (int j=dy-riprad;j<dy+riprad;j++) {
    for (int k=dx-riprad;k<dx+riprad;k++) {
      if (j>=0 && j<height && k>=0 && k<width) {
        ripplemap[oldind+(j*width)+k] += 512;       
      }
    }
  }
}
 
void newframe() {

  i=oldind;
  oldind=newind;
  newind=i;
 
  i=0;
  mapind=oldind;
  for (int y=0;y<height;y++) {
    for (int x=0;x<width;x++) {
      short data = (short)((ripplemap[mapind-width]+ripplemap[mapind+width]+ripplemap[mapind-1]+ripplemap[mapind+1])>>1);
      data -= ripplemap[newind+i];
      data -= data >> 5;
      ripplemap[newind+i]=data;
 

      data = (short)(1024-data);

      a=((x-hwidth)*data/1024)+hwidth;
      b=((y-hheight)*data/1024)+hheight;
 

      if (a>=width) a=width-1;
      if (a<0) a=0;
      if (b>=height) b=height-1;
      if (b<0) b=0;
 
      ripple[i]=texture[a+(b*width)];
      mapind++;
      i++;
    }
  }
}
 

void mousePressed()
{
    disturb(mouseX, mouseY);
//    minim = new Minim(this);
//    wave = minim.loadFile("data/wave.mp3"); 
//    wave.play();
    
}

void mouseReleased()
{
}
