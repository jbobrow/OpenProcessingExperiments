
int numFrames = 15;  // The number of frames in the animation, there are total 14 frames
int frame = 0;
PImage[] images = new PImage[numFrames];
    
void setup() {
  size(827,548); //indicate the screen size of the stop motion
  frameRate(3.5);
 
 //import photos which I took for the stop motion
 
  images[0]  = loadImage("http://i172.photobucket.com/albums/w12/leungmo/moon3_zps56d5ac95.jpg");
  images[1]  = loadImage("http://i172.photobucket.com/albums/w12/leungmo/moon2_zps9dc4f0fe.jpg"); 
  images[2]  = loadImage("http://i172.photobucket.com/albums/w12/leungmo/moon_zpsa86e8e2e.jpg");
  images[3]  = loadImage("http://i172.photobucket.com/albums/w12/leungmo/moon4_zps837c5ecc.jpg"); 
  images[4]  = loadImage("http://i172.photobucket.com/albums/w12/leungmo/moon5_zps1854eab9.jpg");
  images[5]  = loadImage("http://i172.photobucket.com/albums/w12/leungmo/moon6_zps87a5361b.jpg"); 
  images[6]  = loadImage("http://i172.photobucket.com/albums/w12/leungmo/moon7_zps85c7cade.jpg");
  images[7]  = loadImage("http://i172.photobucket.com/albums/w12/leungmo/moon8_zps85ebce50.jpg");
  images[8]  = loadImage("http://i172.photobucket.com/albums/w12/leungmo/moon9_zpse05a98dc.jpg");  
  images[9]  = loadImage("http://i172.photobucket.com/albums/w12/leungmo/moon9_zpse05a98dc.jpg"); 
  images[10]  = loadImage("http://i172.photobucket.com/albums/w12/leungmo/moon10_zps692c0891.jpg"); 
  images[11] = loadImage("http://i172.photobucket.com/albums/w12/leungmo/moon11_zps8d89cb1c.jpg"); 
  images[12] = loadImage("http://i172.photobucket.com/albums/w12/leungmo/moon12_zps441ed4e0.jpg"); 
  images[13] = loadImage("http://i172.photobucket.com/albums/w12/leungmo/moon13_zpsc0a6eaa7.jpg"); 
  images[14] = loadImage("http://i172.photobucket.com/albums/w12/leungmo/moon14_zps743c7aeb.jpg"); 


} 
 
void draw() { 
  background(0);
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
 frame = (frame+1) % numFrames;  // Use % to cycle through frames
  image(images[frame % numFrames], 0, 0);
}
