
int numFrames = 9;
int frame = 0;
int count = 0;
PImage[] images = new PImage[numFrames];

void setup() {
  size(450, 300);
  frameRate(3);
  noLoop();
  
  images[0] = loadImage("stop0.png");
  images[1] = loadImage("stop1.png");
  images[2] = loadImage("stop2.png");
  images[3] = loadImage("stop3.png");
  images[4] = loadImage("stop3.png");
  images[5] = loadImage("stop4.png");
  images[6] = loadImage("stop5.png");
  images[7] = loadImage("stop6.png");
  images[8] = loadImage("stop7.png");



}

void draw () {
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
  else if(count==1){
    noLoop();
    count=0;
  }
  

}

