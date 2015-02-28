
//LeungSzeMei_52631410_Mei
import ddf.minim.*;
Minim minim;
AudioPlayer background;//bg music
AudioSample music;//music when clicked the mouse

int numFrames = 12;//12 pics of montion
int frame=0;
PImage[] images =new PImage[numFrames];
PImage img1 ,img2;

void setup()
{
  size(600,600);
  frameRate(5);
  img1 = loadImage("n3.jpg");//bg img
  img2 = loadImage("cartoon2.png");//mouse img
  //motion img
  images[0] =loadImage("1.jpg");
  images[1] =loadImage("2.jpg");
  images[2] =loadImage("3.jpg");
  images[3] =loadImage("4.jpg");
  images[4] =loadImage("5.jpg");
  images[5] =loadImage("6.jpg");
  images[6] =loadImage("7.jpg");
  images[7] =loadImage("8.jpg");
  images[8] =loadImage("9.jpg");
  images[9] =loadImage("10.jpg");
  images[10] =loadImage("11.jpg");
  images[11] =loadImage("12.jpg");
  
  minim =new Minim (this);
  music=minim.loadSample("comedy.mp3");//music of mouse
   
  background = minim.loadFile("cowboy.mp3");//bg music
  background.loop();  

}
void draw(){
image(img1,0,0);//bg
image(img2,mouseX,mouseX,120,120);//mouse

if (keyPressed ==true){//pressed any button
   frame=(frame+1)% numFrames;
   int offset = 0;
   image(images[frame% numFrames],0,0);
}else{
 image(images[1] ,0,0);
}


if (mousePressed)
music.trigger();

image(img2,mouseX,mouseY,120,120);
}






