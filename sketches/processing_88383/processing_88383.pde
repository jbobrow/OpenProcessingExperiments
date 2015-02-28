
int numFrames = 17;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];
     
void setup()
{
  size(575, 430);
  frameRate(1);
   
  images[0]  = loadImage("animation1.PNG");
  images[1]  = loadImage("animation1.PNG");
  images[2]  = loadImage("animation2.PNG");
  images[3]  = loadImage("animation3.PNG");
  images[4]  = loadImage("animation4.PNG");
  images[5]  = loadImage("animation4.PNG");
  images[6]  = loadImage("animation5.PNG");
  images[7]  = loadImage("animation5.PNG");
  images[8]  = loadImage("animation9.PNG");
  images[9]  = loadImage("animation9.PNG");
  images[10]  = loadImage("animation13.PNG");
  images[11]  = loadImage("animation13.PNG");
  images[12]  = loadImage("animation13.PNG");
  images[13]  = loadImage("animation13.PNG");
  images[14]  = loadImage("animation13.PNG");
  images[15]  = loadImage("animation13.PNG");
  images[16]  = loadImage("animation13.PNG");
}
  
void draw()
{
  background(255,125,0);
  frame = frame + 1;
  if (frame>=numFrames){
   frame=0;
  }
  image(images[frame], 0, 0);
}



