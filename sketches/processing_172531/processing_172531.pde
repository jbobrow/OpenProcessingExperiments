
PImage me;
int curPix = 0;

void setup(){
  size(1920,1280);
  me = loadImage("me.PNG");
  loadPixels();
  me.loadPixels();
}

void draw(){
  color now = me.pixels[curPix];
  background(now);
  curPix ++;
  if(curPix > me.pixels.length){
    curPix = 0;
  }
}


