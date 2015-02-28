
int numFrames = 14;
int frame = 0;
PImage[] images = new PImage[numFrames];
PImage img = loadImage("stretchgirl.png");
PImage img2 = loadImage("text3.png");
PImage img3 = loadImage("text2.png");
PImage img4 = loadImage("text1.png");
PImage img5 = loadImage("text4.png");
PImage img6 = loadImage("text5.png");
PImage img7 = loadImage("text6.png");
PFont font;


void setup()
{
  size(640,400);
  frameRate(5);
  
  images[0] = loadImage("stretchguy1.png");
  images[1] = loadImage("stretchguy2.png");
  images[2] = loadImage("stretchguy3.png");
  images[3] = loadImage("stretchguy4.png");
  images[4] = loadImage("stretchguy5.png");
  images[5] = loadImage("stretchguy6.png");
  images[6] = loadImage("stretchguy7.png");
  images[7] = loadImage("text3.png");
  images[8] = loadImage("text2.png");
  images[9] = loadImage("text1.png");
  images[10] = loadImage("text6.png");
  images[11] = loadImage("text5.png");
  images[12] = loadImage("text4.png");
  images[13] = loadImage("stretchgirl.png");
}

void draw()

{
   float randomx;
  randomx = random(640);
  
  if (mousePressed == true) {
 frame = frame + 1;
}
if (!mousePressed&&(frame<7))
{frame = frame - 1;
}
if (frame<0) {
  frame=0;
}
if (frame>=numFrames){
    frame=0;
  }
if (frame==13) {
 noLoop();
}
 image(images[frame], 0, 0);
}

void mousePressed()

{if(frame>6) {
  frame = frame;
}

}


