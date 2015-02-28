
import pFaceDetect.*;
import JMyron.*;

PFaceDetect face;
JMyron m;
PImage webcam;
int numFrames = 42;  
int frame = 0;
PImage[] images = new PImage[numFrames];

void setup() {
  size(640,480);
  m = new JMyron();
  m.start(width,height);
  m.findGlobs(0);
  face = new PFaceDetect(this,width,height,
  "haarcascade_frontalface_default.xml");
  frameRate(15);
  webcam = createImage(width,height,ARGB);
  ellipseMode(CORNER);
 frameRate(30);
  
  images[0]  = loadImage("1.png");
  images[1]  = loadImage("1.png"); 
  images[2]  = loadImage("1.png");
  images[3]  = loadImage("1.png"); 
  images[4]  = loadImage("2.png");
  images[5]  = loadImage("2.png"); 
  images[6]  = loadImage("2.png");
  images[7]  = loadImage("3.png"); 
  images[8]  = loadImage("3.png");
  images[9]  = loadImage("3.png"); 
  images[10] = loadImage("4.png");
  images[11] = loadImage("4.png");
  images[12] = loadImage("4.png");
  images[13] = loadImage("4.png");
  images[14] = loadImage("5.png");
 images[15] = loadImage("5.png"); 
 images[16] = loadImage("5.png");
 images[17] = loadImage("6.png");
 images[18] = loadImage("6.png");
 images[19] = loadImage("6.png");
 images[20] = loadImage("6.png");
 images[21] = loadImage("7.png");
 images[22] = loadImage("7.png");
 images[23] = loadImage("7.png");
 images[24] = loadImage("8.png");
 images[25] = loadImage("8.png");
 images[26] = loadImage("8.png");
 images[27] = loadImage("8.png");
 images[28] = loadImage("9.png");
 images[29] = loadImage("9.png");
 images[30] = loadImage("9.png");
 images[31] = loadImage("10.png");
 images[32] = loadImage("10.png");
 images[33] = loadImage("10.png");
 images[34] = loadImage("10.png");
 images[35] = loadImage("11.png");
 images[36] = loadImage("11.png");
 images[37] = loadImage("11.png");
 images[38] = loadImage("12.png");
 images[39] = loadImage("12.png");
 images[40] = loadImage("12.png");
 images[41] = loadImage("12.png");
}


void draw() {
  background(0);
  m.update();
  arraycopy(m.cameraImage(),webcam.pixels);
  webcam.updatePixels();
  face.findFaces(webcam);
  image(webcam,0,0,width,height);
  drawFace();
}



void drawFace() {
  int [][] res = face.getFaces();
  if (res.length>0) {
    for (int i=0;i<res.length;i++) {
      int x = res[i][0];
      int y = res[i][1];
      int w = res[i][2];
      int h = res[i][3];
 
      float razao = (float) 1/5;
      razao = (float)1/(1-razao);
     
      frame = (frame+1) % numFrames;  
  image(images[frame],x-w*((razao-1)/2),y-h*((razao-1)/2),w*razao,h*razao);
      
    }
  }
}
void stop() {
  m.stop();
  super.stop();
}


