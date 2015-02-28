
int numFrames=13;
int frame = 0;
PImage[] images = new PImage[numFrames];
 
void setup(){
  size(500, 500);
  frameRate(1.2);
   
  images[0]  = loadImage("0.jpg");
  images[1]  = loadImage("1.jpg");
  images[2]  = loadImage("2.jpg");
  images[3]  = loadImage("3.jpg");
  images[4]  = loadImage("4.jpg");
  images[5]  = loadImage("5.jpg");
  images[6]  = loadImage("6.jpg");
  images[7]  = loadImage("7.jpg");
  images[8]  = loadImage("8.jpg");
  images[9] = loadImage ("9.jpg");
  images [10] = loadImage ("10.jpg");
  images [11] = loadImage ("11.jpg");
  images [12] = loadImage ("12.jpg");
  
}
 
void draw(){
  background(0);
  frame = frame + 1;
  if (frame>numFrames){
    frame=0;
  }
   
  image(images[frame],0,0);
  filter(GRAY, 8);
}





