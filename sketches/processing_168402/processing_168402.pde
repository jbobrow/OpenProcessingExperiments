
/* @pjs preload="10.jpg, 11.jpg, 12.jpg, 13.jpg, 14.jpg, 15.jpg, 2.jpg, 3.jpg, 4.jpg, 5.jpg, 6.jpg, 7.jpg, 8.jpg, 9.jpg"; 
 */


int numFrames=15;
int frame=1;
PImage[]images=new PImage[numFrames];

void setup(){
  size(500,500);
  frameRate(10);
  //images[0]=loadImage("1.jpg");
  images[1]=loadImage("2.jpg");
  images[2]=loadImage("3.jpg");
  images[3]=loadImage("4.jpg");
  images[4]=loadImage("5.jpg");
  images[5]=loadImage("6.jpg");
  images[6]=loadImage("7.jpg");
  images[7]=loadImage("8.jpg");
  images[8]=loadImage("9.jpg");
  images[9]=loadImage("10.jpg");
  images[10]=loadImage("11.jpg");
  images[11]=loadImage("12.jpg");
  images[12]=loadImage("13.jpg");
  images[13]=loadImage("14.jpg");
  images[14]=loadImage("15.jpg");
}
void draw(){
  frame++;
  if(frame == numFrames){
    frame=1;
  }
  image(images[frame],0,0);
}

