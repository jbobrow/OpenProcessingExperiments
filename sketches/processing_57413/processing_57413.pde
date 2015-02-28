
import processing.opengl.*;
import gifAnimation.*;
import glitchP5.*; // import GlitchP5
PImage[] animation;
import processing.video.*;


Gif loopingGif;
GlitchP5 glitchP5;
Capture video;

int camw = 480; //320 or 466
int camh = 360; //240 or 350
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
  glitchP5 = new GlitchP5(this); // initiate the glitchP5 instance;
 loopingGif = new Gif(this, "laa2.gif");
 loopingGif.loop();

  //img = loadImage("moon3.jpg");
  // declare a variable of type Capture called 
  // video, and send it four parameters:
  // this, width, height, framerate (in seconds)
  video = new Capture(this,camw,camh, fps);
}

void draw() {
  //image(loopingGif,0,0);
  video.loadPixels();
  for(int y = 0; y<video.height; y++){
    for(int x = video.width-1; x >= 0; x--){
      int location = x + y * video.width;
      color videoC = video.pixels[location];
     // color imageC = img.pixels[location];
      color gifC = loopingGif.pixels[location];
      drawPoints(videoC,imageC,gifC,x,y);
      
      newx++;
    }
    newx = 0;
    newy++; 
}
newy = 0;

video.updatePixels();
glitchP5.run();
  
}

void drawPoints(color videoC, color imageC, color gifC, int x, int y){
      if( (red(videoC) < lastR-varR || red(videoC) > lastR+varR) 
  && (green(videoC) < lastG-varG || green(videoC) > lastG+varG)
  && (blue(videoC) < lastB-varB || blue(videoC) > lastB+varB)
  && x != 0 && y != 0){
       strokeWeight(4);
       stroke(0);
       point(newx,newy);
      // point(newx+random(10)-5,newy+random(10)-5);
      }
      else{
      strokeWeight(4);
      //stroke (random(255),random(255),random(255));
      stroke(gifC);
      point(newx,newy);
     // point(newx+random(100)-50,newy+random(100)-50);
      }
     
     // strokeWeight(4);
     //  stroke(videoC);
     //  point(newx,newy);
    
}

void keyPressed(){
   glitchP5.glitch(mouseX, mouseY, 200, 400, 480, 1200, 3, 0.5f, 10, 40);
}

void captureEvent(Capture v){
  v.read();
  
}


