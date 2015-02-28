
import processing.video.*;

Capture video;

int camw = 466; //320
int camh = 350; //240
int fps = 15;
int newx = 0; //my x
int newy = 0; //my y

color lastPix;
color lastR;
color lastB;
color lastG;
int varR=70;
int varG=70;
int varB=70;

void setup() {
  size(camw,camh,P2D);
  background(0);
  noCursor();
  // declare a variable of type Capture called 
  // video, and send it four parameters:
  // this, width, height, framerate (in seconds)
  video = new Capture(this,camw,camh, fps);
}

void draw() {
  
  video.loadPixels();
  for(int y = 0; y<video.height; y++){
    for(int x = video.width-1; x >= 0; x--){
      int location = x + y * video.width;
      color c = video.pixels[location];
      
      drawPoints(c,x,y);
      
      newx++;
    }
    newx = 0;
    newy++; 
}
newy = 0;
video.updatePixels();
  
}

void drawPoints(color c, int x, int y){
  if( (red(c) < lastR-varR || red(c) > lastR+varR) 
  && (green(c) < lastG-varG || green(c) > lastG+varG)
  && (blue(c) < lastB-varB || blue(c) > lastB+varB)
  && x != 0 && y != 0){
      strokeWeight(4);
      stroke (random(255),random(255),random(255));
      point(newx, newy);
  } 
  
  else{
      strokeWeight(4);
      stroke (c);
      point(newx, newy);
  }
  println(red(c));
  println(lastR);
}


void captureEvent(Capture v){
  v.read();
}


