

int numFrames = 41;  // The number of frames in the animation
 int frame = 0;
 PImage[] images = new PImage[numFrames];
 void setup()
 {
   size(576, 576);
   frameRate(7);
   images[0]  = loadImage("man1.png");
   images[1]  = loadImage("man2.png"); 
  images[2]  = loadImage("man3.png"); 
  images[3]  = loadImage("man4.png"); 
  images[4]  = loadImage("man5.png"); 
  images[5]  = loadImage("man6.png"); 
  images[6]  = loadImage("man7.png"); 
  images[7]  = loadImage("man8.png"); 
  images[8]  = loadImage("man9.png"); 
  images[9]  = loadImage("man10.png"); 
  images[10]  = loadImage("man11.png"); 
  images[11]  = loadImage("man12.png"); 
  images[12]  = loadImage("man13.png"); 
  images[13]  = loadImage("man14.png"); 
  images[14]  = loadImage("man15.png"); 
  images[15]  = loadImage("man16.png"); 
  images[16]  = loadImage("man17.png"); 
  images[17]  = loadImage("man18.png"); 
  images[18]  = loadImage("man19.png"); 
  images[19]  = loadImage("man20.png"); 
  images[20]  = loadImage("man21.png"); 
  images[21]  = loadImage("man22.png"); 
  images[22]  = loadImage("man23.png"); 
  images[23]  = loadImage("man24.png"); 
  images[24]  = loadImage("man25.png"); 
  images[25]  = loadImage("man26.png"); 
  images[26]  = loadImage("man27.png"); 
  images[27]  = loadImage("man28.png"); 
  images[28]  = loadImage("man29.png"); 
  images[29]  = loadImage("man30.png"); 
  images[30]  = loadImage("man31.png");   
  images[31]  = loadImage("man32.png");
  images[32]  = loadImage("man33.png");
  images[33]  = loadImage("man34.png");
  images[34]  = loadImage("man35.png");
  images[35]  = loadImage("man36.png");
  images[36]  = loadImage("man37.png");
  images[37]  = loadImage("man37.png");
  images[38]  = loadImage("man37.png");
  images[39]  = loadImage("man37.png");
  images[40]  = loadImage("man37.png");
} 
void draw() 
{ 
  background(0);
   frame = frame + 1;
   if (frame>=numFrames){
    frame=0; 
  }
  // frame = (frame+1) % numFrames;  // Use % to cycle through frames
   image(images[frame], 0, 0);
 }

