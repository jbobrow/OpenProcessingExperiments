
int numFrames = 19;
int frame = 0;
int count = 0;
PImage[] images = new PImage[numFrames];

void setup() {
size(369, 252);
  frameRate(5);
  noLoop();
  
  images[0] = loadImage("m0.png");
  images[1] = loadImage("m1.png");
  images[2] = loadImage("m2.png");
  images[3] = loadImage("m3.png");
  images[4] = loadImage("m4.png");
  images[5] = loadImage("m5.png");
  images[6] = loadImage("m6.png");
  images[7] = loadImage("m7.png");
  images[8] = loadImage("m8.png");
  images[9] = loadImage("m9.png");
  images[10] = loadImage("m10.png");
  images[12] = loadImage("m12.png");
  images[13] = loadImage("m13.png");
  images[14] = loadImage("m14.png");
  images[15] = loadImage("m15.png");
  images[16] = loadImage("m16.png");
  images[17] = loadImage("m17.png");
  images[18] = loadImage("m18.png");



}



void draw() {
  frame++;
  if (frame == numFrames) {
    frame = 0;
  }
    
   image(images[frame], 0, 0);
  
}

void mousePressed()
{
  if (count==0){
  loop();
  count=1;
  }

  
} 

void mouseReleased()
{ if (count==1){
  noLoop();
  count=0;
}
}
  


