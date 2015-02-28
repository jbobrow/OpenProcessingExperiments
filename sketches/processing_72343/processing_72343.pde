
int numFrames = 11;
int frame = 0;
PImage ghost;
PImage[] images = new PImage[numFrames];


void setup() {
  
 ghost = loadImage("ghost.jpeg");
  
 size(695,467);
 background(ghost);
  
 frameRate(19);
  
  images[0]  = loadImage("horse_back_0000.jpg");
  images[1]  = loadImage("horse_back_0001.jpg"); 
  images[2]  = loadImage("horse_back_0002.jpg");
  images[3]  = loadImage("horse_back_0003.jpg"); 
  images[4]  = loadImage("horse_back_0004.jpg");
  images[5]  = loadImage("horse_back_0005.jpg"); 
  images[6]  = loadImage("horse_back_0006.jpg");
  images[7]  = loadImage("horse_back_0007.jpg"); 
  images[8]  = loadImage("horse_back_0008.jpg");
  images[9]  = loadImage("horse_back_0009.jpg"); 
  images[10] = loadImage("horse_back_0010.jpg");


}


void draw() {
  
 if(mousePressed==true) {
  frame = (frame+1) % numFrames;
  image(images[frame], 193,174);  
 }
 else {
 image(ghost,0,0);
 }
  
  
}

