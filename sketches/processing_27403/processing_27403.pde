
import processing.opengl.*;
import ddf.minim.*;

Minim minim;
AudioInput in;

PImage brickwall;
PImage[] movingbricks = new PImage[35];
//coordinates for the bricks
int[] x = {131,359,641,397,79,767,602,209,307,
           842,434,0,430,323,887,193,650,583,695,
           173,877,707,610,0,460,178,815,416,626,
           275,37,872,842,155,893};
int[] y = {34,72,121,282,283,223,226,388,231,436,580,
           582,436,486,579,676,673,22,327,130,
           166,535,387,439,726,489,76,181,483,582,676,264,717,
           226,376};            

void setup() {
size(1024, 768, OPENGL);
frameRate(100);
//loading the images
brickwall = loadImage("brickchange.jpg");
for(int i=0; i<35; i++) {
 String imageName = "brick" + nf(i, 2) + ".jpg";
 movingbricks[i] = loadImage(imageName);
}
  minim = new Minim(this);
  minim.debugOn();
  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);
}

void draw() {
image(brickwall, 0, 0);
for (int i=0;i<35;i++){
  for(int j = 0; j < in.bufferSize(); j++) {
    //break the diagonal motion of the bricks.
  image(movingbricks[i],x[i]+in.left.get(j)*50,y[i]+in.right.get(j)*50);     
}
}
}

void stop()
{
  in.close();
  minim.stop();
  super.stop();
}

