
import gifAnimation.*;
GifMaker gifExport;
PImage first;
PImage second;
PImage third;
PImage fourth;
int x = 0;
int y = 0;
int r = 50;
int s = 50/2;
int a = 30/2;
int n = 0;
int i=0;

/*PImage[] images = new PImage[4]; 

images[0] = loadImage("1.jpg");
images[1] = loadImage("2.jpg");
images[2] = loadImage("3.jpg");
images[3] = loadImage("4.jpg");
*/
PImage[] images = new PImage[4]; //image array


void setup(){
  frameRate(15);
  //size(displayWidth,displayHeight);
  size(500,650);
  background(#8346C1);
  gifExport = new GifMaker(this, "faces.gif");
  gifExport.setRepeat(0);
  /*first=loadImage("1.jpg");
  second=loadImage("2.jpg");
  third=loadImage("3.jpg");
  fourth=loadImage("4.jpg");*/
  images[0] = loadImage("1.jpg");
images[1] = loadImage("2.jpg");
images[2] = loadImage("3.jpg");
images[3] = loadImage("4.jpg");

  
}

void draw(){
  //background(255);
  image(images[i],x,y,100/2,60/2);
  x+=a;
  y=y+s;
  if (x>width-50){
    a=a*-1;
    i=0;
  }
  if (x<0){
   a=a*-1; 
   i=1;
  }
  if (y>height-30){
    s=s*-1;
    i=2;
  }
  if (y<0){
   s=s*-1; 
   i=3;
  }
  if (frameCount/5 == n){ 
  gifExport.setDelay(1);
  gifExport.addFrame();
  n = n+1;
  }
}

void mousePressed(){
  gifExport.finish();
  println("gif saved");
}
