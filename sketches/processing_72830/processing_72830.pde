
//This code is modded from Sequential by James Patterson. 
//Displaying a sequence of images creates the illusion of motion.
//Images are loaded and each is displayed individually in a loop.
  
int numFrames = 32;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];
     
void setup()
{
  size(528, 482);
  frameRate(2);
   
  images[0]  = loadImage("BirdFull1.png");
  images[1]  = loadImage("birdfull2.png");
  images[2]  = loadImage("birdfull3.png");
  images[3]  = loadImage("birdfull4.png");
  images[4]  = loadImage("birdfull5.png");
  images[5]  = loadImage("birdfull6.png");
  images[6]  = loadImage("birdfull7.png");
  images[7]  = loadImage("birdfull8.png");
  images[8]  = loadImage("birdfull9.png");
  images[9]  = loadImage("birdfull10.png");
  images[10]  = loadImage("birdfull11.png");
  images[11]  = loadImage("birdfull12.png");
  images[12]  = loadImage("birdfull13.png");
  images[13]  = loadImage("birdfull14.png");
  images[14]  = loadImage("birdfull15.png");
  images[15]  = loadImage("birdfull16.png");
  images[16]  = loadImage("birdfull17.png");
  images[17]  = loadImage("birdfull18.png");
  images[18]  = loadImage("birdfull19.png");
  images[19]  = loadImage("birdfull20.png");
  images[20]  = loadImage("birdfull21.png");
  images[21]  = loadImage("birdfull22.png");
  images[22]  = loadImage("birdfull23.png");
  images[23]  = loadImage("birdfull24.png");
  images[24]  = loadImage("birdfull25.png");
  images[25]  = loadImage("birdfull26.png");
  images[26]  = loadImage("birdfull27.png");
  images[27]  = loadImage("birdfull28.png");
  images[28]  = loadImage("birdfull29.png");
  images[29]  = loadImage("birdfull30.png");
  images[30]  = loadImage("birdfull31.png");
  images[31]  = loadImage("birdfull32.png");
}
  
void draw()
{
  background(0,0,0);
  frame = frame + 1;
  if (frame>=numFrames){
   frame=0;
  }
 // frame = (frame+1) % numFrames;  // Use % to cycle through frames
  image(images[frame], 50, 50);
}

