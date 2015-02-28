
import processing.video.*;

int width = 640;
int height = 480;

Capture Camera;
PImage Pcamera;
PImage Bkimg;

boolean Cam = false;

int Pos;
float[] X = new float[width * height];
float[] Y = new float[width * height];
float[] Spx = new float[width * height];
float[] Spy = new float[width * height];
float[] Sum = new float[width * height];
float[] Count = new float[width * height];
boolean Fade = false;

void setup(){
  size(width, height);
  colorMode(HSB, 256, 100, 100);
  frameRate(10);
  noStroke();
  
  Camera = new Capture(this, width, height, 15);
  
  Pcamera = new PImage(width, height);
  Bkimg = new PImage(width, height);
  
  for(int y=0; y<height; y++){
    for(int x=0; x<width; x++){
      Pos = (y * width) + x;
      X[Pos] = x;
      Y[Pos] = y;
      Spx[Pos] = 0;
      Spy[Pos] = random(-10, 0);
      
      Sum[Pos] = 0;
      Count[Pos] = 0;
    }
  }
  
}

void draw(){  
  if(Cam){
  tint(255);
  image(Bkimg, 0, 0);
  
  Bkimg.loadPixels();
  Camera.loadPixels();
  
  for(int y=0; y<height; y++){
    for(int x=0; x<width; x++){
      Pos = (y * width) + x;
      color cam_c  = Camera.pixels[Pos];
      float h = hue(cam_c);
      float s = saturation(cam_c);
      float b = brightness(cam_c);
      
      if(h < 40 &&
         s > 20 && s < 80 &&
         b > 20){
           Count[Pos] += 1;
           if(Count[Pos] >= 20){
             Count[Pos] = 20;
             fadeOut(Pos);
           }
           fill(cam_c);
         }
         else{
           Count[Pos] = 0;
           X[Pos] = x;
           Y[Pos] = y;
           fill(cam_c);
         }
      
      rect(X[Pos], Y[Pos], 1, 1);
      
    }
  }
  
  }
  else image(Camera, 0, 0);
}

void mouseReleased(){
  Bkimg.copy(Camera, 0, 0, width, height, 0, 0, width, height);
  Cam = true;
}

void fadeOut(int pos){
    X[pos] += Spx[pos];
    Y[pos] += Spy[pos];
}

void captureEvent(Capture camera){
  camera.read();
}


void fadeToWhite(){
  image(Bkimg, 0, 0);
}
