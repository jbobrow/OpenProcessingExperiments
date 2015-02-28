
/* 
Create an array of animation using images */

int numFrames = 100;  
int currentFrame = 1;
PImage[] images = new PImage[numFrames];

void setup() {
  size(320, 480);
  for(int i=1; i<images.length; i++){
    String windmill="windmill_" + nf(i,3) + ".jpg";
    images[i] = loadImage(windmill); 
  }
  
  frameRate(25);
  

} 
 
void draw() { 
  
 image(images[currentFrame],0,0);
 currentFrame++; //next frame
 
 if(currentFrame == images.length){
   
   currentFrame=1; //repeat to beginning 
 }
}



