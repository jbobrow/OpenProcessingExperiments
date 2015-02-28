
import processing.video.*;

Capture video;

int camw = 320; //320 or 466
int camh = 240; //240 or 350
int fps = 15;
int newx = 0; //my x
int newy = 0; //my y

color lastPix;
color imageC;
color lastR;
color lastB;
color lastG;
int varR=70;
int varG=70;
int varB=70;

PImage img;

void setup() {
  size(camw,camh,P2D);
  background(0);
  noCursor();

  img = loadImage("moon.jpg");
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
      color videoC = video.pixels[location];
      color imageC = img.pixels[location];
      drawPoints(videoC,imageC,x,y);
      
      newx++;
    }
    newx = 0;
    newy++; 
}
newy = 0;

video.updatePixels();
  
}

void drawPoints(color videoC, color imageC, int x, int y){
  if( (red(videoC) < lastR-varR || red(videoC) > lastR+varR) 
  && (green(videoC) < lastG-varG || green(videoC) > lastG+varG)
  && (blue(videoC) < lastB-varB || blue(videoC) > lastB+varB)
  && x != 0 && y != 0){
 
    strokeWeight(4);
      stroke (random(255),random(255),random(255));

      stroke(imageC);
      point(x,y);
      //image(img,x,y);
  } 
  
  else{
    if(x<width/2){
      strokeWeight(4);
      stroke (videoC);
      point(newx, newy);
    }
    if(x>width/2){
      strokeWeight(4);
      stroke(0);
      point(newx,newy);
    }
    else{
      strokeWeight(4);
      stroke(0);
      point(newx,newy);
  }
  }
}


void captureEvent(Capture v){
  v.read();
}


