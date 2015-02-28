
// Example 10-11 from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010

int numFrames = 7; // The number of frames
PImage[] images = new PImage[numFrames]; // Make the array
int currentFrame = 1;

int numTorsos = 6;
PImage [] Bodies = new PImage[numTorsos];
int frameNow = 1;

PImage Mirror;

void setup() {
  size(500, 610);
  background(163,96,74);
 Mirror = loadImage("Mirror.png");
  for (int i = 1; i < images.length; i++) {
    String imageName = ("head-" + nf(i, 6) + ".png"); //change to head, arms, etc
    images[i] = loadImage(imageName); // Load each image
  }
  
  for (int j = 1; j < Bodies.length; j++){
    String torsoName = ("torso-" + nf(j, 4) + ".png");
    Bodies[j] = loadImage(torsoName);
  }
  
  frameRate(6);
}

void draw() {
  background(163,96,74);
  image(Mirror,0,0);
    
  image(Bodies[frameNow], 50, 190);
  //if(mousePressed){
    frameNow++;
 // }
  if (frameNow >= Bodies.length){
    frameNow = 1;
  }
  
    pushMatrix();
  scale(0.65);
  
  image(images[currentFrame], 135, 25);
  if (mousePressed){
  currentFrame++;
  } // Next frame
  if (currentFrame >= images.length) {
    currentFrame = 1;  // Return to first frame
  }
  popMatrix();
  
  

}


