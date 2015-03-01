
/* @pjs preload = "danny1.png" ' */
/* @pjs preload = "danny2. png" */
/* @pjs preload = "danny3.png" */

int numFrames = 9;
int frame = 0;
PImage [] images = new PImage [numFrames];
float angle;
void setup (){
  size (320, 700);
  frameRate (5);
  images [0] = loadImage ("danny1.png");
  images [1] = loadImage ("danny2.png");
  images [2] = loadImage ("danny3.png");
  images [3] = loadImage ("danny2.png");
  images [4] = loadImage ("danny1.png");
  images [5] = loadImage ("danny3.png");
  images [6] = loadImage ("danny2.png");
  images [7] = loadImage ("danny1.png");
  images [8] = loadImage ("danny3.png");

}

void draw (){

  frame ++;
 
  if (frame == numFrames){
    frame = 0;
  } 

    tint (random (255), random (255), random (255), 100);
    angle += .1;
    translate (150, 250);
    rotate (angle);
    
  image (images [frame], 0, 0);
  
  }





