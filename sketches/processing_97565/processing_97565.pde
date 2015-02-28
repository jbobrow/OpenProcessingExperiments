
/* Animation Sketch Homework
 * Written by James Lockrey
 * Date: 29/04/2013
 *
 *
 */

PImage[] anim = new PImage[24];
int numFrames = 24;
int currentFrame = 0;

void setup(){
  size(128,128);
  frameRate(30);
  for(int i = 0; i < numFrames; i++){
    String name = "explosion (" + (i+1) + ").png";
    anim[i] = loadImage(name);
  }
}

void draw(){
  fill(0);
  rect(0,0,width,height);
  if(currentFrame == numFrames) { 
    currentFrame = 0;
  }
  image(anim[currentFrame],0,0);
  currentFrame++;
}


