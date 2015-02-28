
//02/10/2013
//MOK Ka Yee Amanda
//SID 52622241

import ddf.minim.*; 
Minim minim;
AudioPlayer music;
 
PFont myfont = createFont("Verdana", 16); //timer Font size, typeface
 
int numFrames = 24;  // total 24 images
int frame = 0;
PImage[] images =new PImage[numFrames];
 
void setup() {
  size(500 , 500);   //background size
  frameRate(3);      //set framerate as 3
  smooth();  
    
  //background aniamtion
  
  images[0] = loadImage("1-01.png");
  images[1] = loadImage("2-01.png");
  images[2] = loadImage("3-01.png");
  images[3] = loadImage("4-01.png");
  images[4] = loadImage("5-01.png");
  images[5] = loadImage("6-01.png");
  images[6] = loadImage("7-01.png");
  images[7] = loadImage("8-01.png");
  images[8] = loadImage("9-01.png");
  images[9] = loadImage("10-01.png");
  images[10] = loadImage("11-01.png");
  images[11] = loadImage("12-01.png");
  images[12] = loadImage("13-01.png");
  images[13] = loadImage("14-01.png");
  images[14] = loadImage("15-01.png");
  images[15] = loadImage("16-01.png");
  images[16] = loadImage("17-01.png");
  images[17] = loadImage("18-01.png");
  images[18] = loadImage("19-01.png");
  images[19] = loadImage("20-01.png");
  images[20] = loadImage("21-01.png");
  images[21] = loadImage("22-01.png");
  images[22] = loadImage("23-01.png");
  images[23] = loadImage("24-01.png");

  minim =new Minim (this);  
  music = minim.loadFile("tictok.mp3"); //clock sound
  music.loop(); //loop music

}
void draw() {
  
  bg();
  timer();
  clock();
  
}
  
void bg(){
  
  frame = frame + 1 ; 
  while (frame>=numFrames)
  {
    frame = 0; //loop background animation
  }
  image(images[frame], 0, 0);
}
  

void timer(){
 
  fill(200);  //timer
  noStroke();
  
  int a = second(); 
  int b = minute(); 
  int c = hour(); 
  text(c+":"+b+":"+a, 20, 80);

}

void clock(){

  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;  //second 
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;  //minute
  float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI; //hour
  
  stroke(255);
  strokeWeight(1);
  line(250, 250, cos(s) * 72 + 250, sin(s) * 72 + 250);

  strokeWeight(2);
  line(250, 250, cos(m) * 60 + 250, sin(m) * 60 + 250);

  strokeWeight(4);
  line(250, 250, cos(h) * 50 + 250, sin(h) * 50 + 250);
   
}





