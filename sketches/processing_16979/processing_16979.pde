
/*
yb@imal.org

video time cube with 3 modes: x or y temporal depth, or from map image;
- uses current webcam
- takes some time to start displaying, at least time to fill video buffer

inspired:
- by xray timecube object(max/jitter) by W.Smith
http://www.mat.ucsb.edu/~whsmith/xray/xray.jit.timecube.html

- and of course from Vasulka's warp videon (2000):
http://www.vasulka.org/Videomasters/pages_stills/index_99.html

press key as defined in code below to change mode.

*/


import processing.video.*;

int numPixels;
int[][] buffer; //frame buffer
int nbuffer; //current frame in buffer
int maxbuffer = 240; //frame buffer size; 8 sec at 30fps

int mode; //1=xScan; 2=yScan; 3=mapImage
PImage mapImg;
Capture video;

void setup() {
  // Change size to 320 x 240 if too slow at 640 x 480
  // size(320, 240, P2D); 
  size(640, 480, P2D); 
  
  video = new Capture(this, width, height, 30);
  numPixels = video.width * video.height;
  
  // Create buffer to store the video frames
  buffer = new int[maxbuffer][];
  for (int i=0; i<maxbuffer; i++) {
    buffer[i] = new int[numPixels];
  }
  // Make the window pixels[] array available for direct manipulation
  loadPixels();
  nbuffer=0;
  mode=1; //x
}

void draw() {
  if (video.available()) {
    video.read(); // Read a new video frame
    video.loadPixels(); // Make the pixels of video available
    arraycopy(video.pixels, buffer[nbuffer]);
    nbuffer++;
    if (nbuffer>=maxbuffer) nbuffer=0; // circular list
    }
    
    if (mode==1) {
      xScan();}
    else if (mode==2) {
      yScan();
    }
    else if (mode==3) {
      pScan(mapImg);
    }    
    updatePixels(); // Notify that the pixels[] array has changed
}

void yScan() {
  int d;
    for (int y=0; y<height; y++) {//
    //computes the temporal depth of the line y
    d = (int) map(y, 0, height, 0, maxbuffer);
    //find corresponding frame in buffer
    d = nbuffer-1-d;
    if (d<0) d=maxbuffer+d;
    
    arraycopy(buffer[d], y*width, pixels, y*width, width); //faster
    /*
    for (int x=0; x<width; x++) {        
      pixels[y*width+x] = buffer[d][y*width+x];
    } 
    */   
    }
}

void xScan() {
  int d;
  for (int y=0; y<height; y++) {//    
      for (int x=0; x<width; x++) {
        d = (int) map(x, 0, width, 0, maxbuffer);
        //find corresponding frame in buffer
        d = nbuffer-1-d;
        if (d<0) d=maxbuffer+d;      
        pixels[y*width+x] = buffer[d][y*width+x];
      }  
    }
}

void pScan(PImage p) {
  //p is a grayscale image - just take the red channel
  //as temporal depth
  //p size should be same as video...
  int d, b; 
  for (int y=0; y<height; y++) {//    
      for (int x=0; x<width; x++) {       
        b = ( p.pixels[y*width+x] >> 16) & 0xFF; // Like red(), but faster
        d = (int) map(b, 0, 255, 0, maxbuffer);
        //find corresponding frame in buffer
        d = nbuffer-1-d;
        if (d<0) d=maxbuffer+d;      
        pixels[y*width+x] = buffer[d][y*width+x];
      }  
    }
}

void keyPressed() {
  if (key=='x') {
    mode = 1;}
  else if (key=='y') {
    mode = 2;}
  else if (key=='s') {
      // save image
      save("map.png");
      println("map image saved");
      //blur or apply effect with your favorite picture editor...
  }
  else if (key=='p') {
    mapImg = loadImage("map.png");
    println("map image loaded");
    mode= 3;
  }
    
}

