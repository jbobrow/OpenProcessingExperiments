
PImage[] images = new PImage[69];
PImage img = new PImage();

void setup(){
  size(146,143);
  //sets framerate
  frameRate(25);
  //loads images into array
  for (int i = 0; i < images.length; i++){
    images[i] = loadImage( "img (" + (i+1) + ").jpeg");
  }
}

int j = 0;

//cycles through images, resetting once reached max
void draw(){
    image(images[j],0,0);
    if(j == 68)
      j = 0;
    j++;  
   
}




