
/**
 watch
 __/\\\\\\\\\\\\\\\__/\\\________/\\\_
 _\///////\\\/////__\/\\\_______\/\\\_
 _______\/\\\_______\//\\\______/\\\__
 _______\/\\\________\//\\\____/\\\___
 _______\/\\\_________\//\\\__/\\\____
 _______\/\\\__________\//\\\/\\\_____
 _______\/\\\___________\//\\\\\______
 _______\/\\\____________\//\\\_______
 _______\///______________\///________
 
 modded by kof
 */


import codeanticode.gsvideo.*;
GSPipeline pipeline;

int mem[][][];

void setup() {
  pipeline = new GSPipeline(this, "mmssrc location=mms://82.137.248.17/srtv/tv/English/NEWS/EN/31072012.asf ! decodebin ! ffmpegcolorspace");
  pipeline.play();

  size(320, 200, P2D);


  mem = new int[height][width][height];


  background(0);
}

int dir = 1;
int pos = 1;

void draw() {

  pipeline.read();
  pipeline.loadPixels();


  int pos = frameCount%height;

  loadPixels();

  int idx= 0;

  if (pipeline.pixels.length>0) {
    for (int y = 0 ; y < height;y++) {
      for (int x = 0 ; x < width;x++) {
        idx = y*width+x;
        mem[pos][x][y] = pipeline.pixels[idx];
      }
    }


    for (int y = 0 ; y < height;y++) {
      for (int x = 0 ; x < width;x++) {
        idx = y*width+x;
        pixels[idx] = mem[(y+pos)%height][x][y];
      }
    }
  }
}


void captureEvent(GSPipeline c) {
  c.read();
  c.loadPixels();
}


