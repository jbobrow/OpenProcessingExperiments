



int numFrames =35;


int frame=0;
PImage[] images =new PImage[numFrames];
PImage rain;
void setup() {
  size(1200, 1100);
  frameRate(5);
  rain=loadImage("rain.png");
  
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
  images[12] =loadImage("13.jpg");
  images[13] =loadImage("14.jpg");
  images[14] =loadImage("15.jpg");
  images[15] =loadImage("16.jpg");
  images[16] =loadImage("17.jpg");
  images[17] =loadImage("18.jpg");
  images[18] =loadImage("19.jpg");
  images[19] =loadImage("20.jpg");
  images[20] =loadImage("21.jpg");
  images[21] =loadImage("22.jpg");
  images[22] =loadImage("23.jpg");
  images[23] =loadImage("24.jpg");
  images[24] =loadImage("25.jpg"); 
  images[25] =loadImage("26.jpg");
  images[26] =loadImage("27.jpg");
  images[27] =loadImage("28.jpg");
  images[28] =loadImage("29.jpg");
  images[29] =loadImage("30.jpg"); 
  images[30] =loadImage("31.jpg");
  images[31] =loadImage("32.jpg");
  images[32] =loadImage("33.jpg");
  images[33] =loadImage("34.jpg");
  images[34] =loadImage("35.jpg");
}
void draw() {
  background(0);

  frame = frame +1;
  while (frame>=numFrames)

  {
    frame=0;
  }
  image(images[frame], 0, 0);
  
  image(rain,mouseX,mouseX,60,60);
  
  
}



