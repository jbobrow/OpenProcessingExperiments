
//02/10/2013
//MOK Ka Yee Amanda
//SID 52622241


int numFrames = 22;  //22 frames
int frame = 0;
PImage[] images =new PImage[numFrames];

void setup() {
  size(600 , 400);   //Set the bg as 600 x 400
  frameRate(3);      //Set the frameRate as 3
   
  images[0] = loadImage("1.png");
  images[1] = loadImage("2.png");
  images[2] = loadImage("3.png");
  images[3] = loadImage("4.png");
  images[4] = loadImage("5.png");
  images[5] = loadImage("6.png");
  images[6] = loadImage("7.png");
  images[7] = loadImage("8.png");
  images[8] = loadImage("9.png");
  images[9] = loadImage("10.png");
  images[10] = loadImage("11.png");
  images[11] = loadImage("12.png");
  images[12] = loadImage("13.png");
  images[13] = loadImage("14.png");
  images[14] = loadImage("15.png");
  images[15] = loadImage("16.png");
  images[16] = loadImage("17.png");
  images[17] = loadImage("18.png");
  images[18] = loadImage("19.png");
  images[19] = loadImage("20.png");
  images[20] = loadImage("21.png");
  images[21] = loadImage("22.png");

}
void draw() {
  background(0);
 
  frame = frame + 1 ;
  while (frame>=numFrames)
  {
    frame=22;
  }
  image(images[frame], 0, 0);
  
}



