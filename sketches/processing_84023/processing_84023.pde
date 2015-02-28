

import processing.video.*;


int cellSize = 10;
int cols, rows;
Capture video;

float eyex;
float eyey;
float eyez;
float centerx;
float centery;
float centerz;
float topx;
float topy;
float topz;
int boxbox;

int loopcount;
void setup() {
  loopcount=0;
  size(640, 480, P3D);
  boxbox=1;
  frameRate(30);
  cols = width / cellSize;
  rows = height / cellSize;
  colorMode(RGB, 255, 255, 255, 100);
  video = new Capture(this, width, height);
  video.start();
  noStroke();
  eyex = 195;
  eyey = 180;
  eyez = 200;
  centerx = 195;
  centery = 160;
  centerz = 0;
  topx = 0;
  topy = 0;
  topz = 1.0;
}


void draw() { 
  if (video.available()) {
    video.read();
    video.loadPixels();
    
    background(0);
    if(mousePressed || loopcount==6)
    {
      loopcount=1;
      eyez=300;
      eyex=400;
      eyey=400;
    }
    if(loopcount==0)
    {
      eyez++;
      if(eyez==350)
      {
        eyez=300;
        eyex=400;
        eyey=400;
        loopcount=1;
      }
    }
    if(loopcount==1)
     {
       eyex--;
       eyey--;
       if(eyex<=0)
       {
         eyex = 195;
         eyey = 170;
         eyez = 300;
         loopcount=2;
       }
     }
     if(loopcount==2)
     {
       eyez--;
       if(eyez<=100)
       {
         eyex = 300;
         eyey = 50;
         eyez = 100;
         loopcount=3;
       }
     }
     if(loopcount==3)
     {
       eyey++;
       if(eyey==300)
       {
         loopcount=4;
         eyex=100;
         eyey=100;
         eyez=200;
         centerx=110;
         centery=110;
         centerz=0;
       }
     }
     if(loopcount==4)
     {
       centerx++;
       centery++;
       if(centerx==300)
       {
         eyex = 195;
         eyey = 180;
         eyez = 200;
         centerx = 195;
         centery = 160;
         centerz = 0;
         loopcount=0;
       }
     }
    pointLight(255, 255, 255, eyex, eyey, eyez);
    camera(eyex, eyey, eyez, centerx, centery, centerz, topx, topy, -topz);
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        int x = i*cellSize;
        int y = j*cellSize;
        int loc = (video.width - x - 1) + y*video.width;
        float r = red(video.pixels[loc]);
        float g = green(video.pixels[loc]);
        float b = blue(video.pixels[loc]);
        color c = color(video.pixels[loc], 75);
 
          
          //translate(0, 3, 0);
          
        translate(0, 6, brightness(video.pixels[loc])/10);
          stroke(c);
          line(0, 0, 0, 0, 0, -brightness(video.pixels[loc])/10);
          noStroke();
          fill(c);
        box(5, 5, 3);
        translate(0, 0, -brightness(video.pixels[loc])/10);
      }
      translate(6, -6*rows, 0);
    }
  }
}

void keyPressed() {
  
}


