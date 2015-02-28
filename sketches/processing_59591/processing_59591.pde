
int numFrames = 8;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];
     
void setup()
{
  size(500, 500);
  frameRate(11);
   
  images[0]  = loadImage("http://s1066.photobucket.com/albums/u409/Brian_12k/_character1.jpg");
  images[1]  = loadImage("http://s1066.photobucket.com/albums/u409/Brian_12k/_character2.jpg");
  images[2]  = loadImage("http://s1066.photobucket.com/albums/u409/Brian_12k/_character3.jpg");
  images[3]  = loadImage("http://s1066.photobucket.com/albums/u409/Brian_12k/_character4.jpg");
  images[4]  = loadImage("http://s1066.photobucket.com/albums/u409/Brian_12k/_character5.jpg");
  images[5]  = loadImage("http://s1066.photobucket.com/albums/u409/Brian_12k/_character 6.jpg");
  images[6]  = loadImage("http://s1066.photobucket.com/albums/u409/Brian_12k/_character7.jpg");
  images[7]  = loadImage("http://s1066.photobucket.com/albums/u409/Brian_12k/_character 8.jpg");
 
   
 
}
  
void draw()
{
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
  image(images[frame], 20, 20);
}


