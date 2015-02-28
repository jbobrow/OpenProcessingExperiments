
int numFrames = 13;
int frame = 0;
PImage[] myImages = new PImage[numFrames];
    
void setup()
{
  size(100, 64);
  frameRate(10);
  
  myImages[0]  = loadImage("mouthshapes1.jpg");
  myImages[1]  = loadImage("mouthshapes2.jpg"); 
  myImages[2]  = loadImage("mouthshapes3.jpg");
  myImages[3]  = loadImage("mouthshapes4.jpg"); 
  myImages[4]  = loadImage("mouthshapes5.jpg");
  myImages[5]  = loadImage("mouthshapes6.jpg"); 
  myImages[6]  = loadImage("mouthshapes7.jpg");
  myImages[7]  = loadImage("mouthshapes8.jpg"); 
  myImages[8]  = loadImage("mouthshapes9.jpg");
  myImages[9]  = loadImage("mouthshapes10.jpg"); 
  myImages[10] = loadImage("mouthshapes11.jpg");
  myImages[11] = loadImage("mouthshapes12.jpg"); 
  myImages[12] = loadImage("mouthshapes13.jpg"); 
} 
 
void draw() 
{ 
  frame = (frame+1) % numFrames;
  image(myImages[frame], 0, 0);
}

