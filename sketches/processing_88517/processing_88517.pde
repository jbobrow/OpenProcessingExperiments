
int numFrames = 14;  
int frame = 0;
PImage[] images = new PImage[numFrames];
      
void setup()
{
  size(480, 640);
  frameRate(1);
    
  images[0]  = loadImage("pg1.jpg");
  images[1]  = loadImage("pg2.jpg");
  images[2]  = loadImage("pg3.jpg");
  images[3]  = loadImage("pg4.jpg");
  images[4]  = loadImage("pg5.jpg");
  images[5]  = loadImage("pg6.jpg");
  images[6]  = loadImage("pg7.jpg");
  images[7]  = loadImage("pg8.jpg");
  images[8]  = loadImage("pg9.jpg");
  images[9] = loadImage ("pg10.jpg");
  images [10] = loadImage ("pg11.jpg");
  images [11] = loadImage ("pg12.jpg");
  images [12] = loadImage ("pg13.jpg");
  images [13] = loadImage ("pg14.jpg");
  images [14] = loadImage ("pg15.jpg");
 
}
   
void draw()
{
  background(255,255,255);
  frame = frame + 1;
  if (frame>=numFrames){
   frame=0;
  }

  image(images[frame], 50, 50);
}


