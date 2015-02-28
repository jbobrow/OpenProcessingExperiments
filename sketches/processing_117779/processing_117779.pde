

//LeungSzeMei_52631410_Mei

import ddf.minim.*;
Minim minim;
AudioPlayer background;//bg music
AudioSample music;//music when clicked the mouse

int numFrames = 50;//50 pics of montion
int frame=0;
PImage[] images =new PImage[numFrames];
PImage img1 ,img2;

void setup()
{
  size(500,400);
  frameRate(5);
  img1 = loadImage("1.jpg");//bg img
  img2 = loadImage("bluefish.png");//mouse img


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
  images[35] =loadImage("36.jpg");
  images[36] =loadImage("37.jpg");
  images[37] =loadImage("38.jpg");
  images[38] =loadImage("39.jpg");
  images[39] =loadImage("40.jpg");
  images[40] =loadImage("41.jpg");
  images[41] =loadImage("42.jpg");
  images[42] =loadImage("43.jpg");
  images[43] =loadImage("44.jpg");
  images[44] =loadImage("45.jpg"); 
  images[45] =loadImage("46.jpg");
  images[46] =loadImage("47.jpg");
  images[47] =loadImage("48.jpg");
  images[48] =loadImage("49.jpg");
  images[49] =loadImage("50.jpg");

  
  minim =new Minim (this);
   music=minim.loadSample("Duck.mp3");//music of mouse
   
  background = minim.loadFile("Happy Tree Friends.mp3");//bg music
  background.loop();  

}
void draw(){

image(img1,0,0);//bg

if (keyPressed ==true){//pressed any button
   frame=(frame+1)% numFrames;
   int offset = 0;
   image(images[frame% numFrames],0,0);
}else{
 image(images[1] ,0,0);
}

if (mousePressed)
music.trigger();

image(img2,mouseX,mouseY,50,25);


}






