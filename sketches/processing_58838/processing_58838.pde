

int numFrames = 8;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];
    
void setup()
{
  size(500, 500);
  frameRate(11);
  
  images[0]  = loadImage("http://i1086.photobucket.com/albums/j443/MrLukeyD/Sequence_1.jpg");
  images[1]  = loadImage("http://i1086.photobucket.com/albums/j443/MrLukeyD/Sequence_2.jpg"); 
  images[2]  = loadImage("http://i1086.photobucket.com/albums/j443/MrLukeyD/Sequence_3.jpg");
  images[3]  = loadImage("http://i1086.photobucket.com/albums/j443/MrLukeyD/Sequence_2.jpg"); 
  images[4]  = loadImage("http://i1086.photobucket.com/albums/j443/MrLukeyD/Sequence_1.jpg");
  images[5]  = loadImage("http://i1086.photobucket.com/albums/j443/MrLukeyD/Sequence_4.jpg"); 
  images[6]  = loadImage("http://i1086.photobucket.com/albums/j443/MrLukeyD/Sequence_5.jpg");
  images[7]  = loadImage("http://i1086.photobucket.com/albums/j443/MrLukeyD/Sequence_4.jpg"); 

  

} 
 
void draw() 
{ 
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
  image(images[frame], 20, 20);
}
