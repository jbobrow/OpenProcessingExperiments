
////

PImage green;
PImage red;
PImage yellow;
PImage blue;
PImage green2;
PImage red2;
PImage yellow2;
PImage blue2;

////

int time1 = 1000;
int time2 = 2000;

float x = 0;


void setup(){
  size(800, 800);
  green = loadImage("green.jpg");
  red = loadImage("red.jpg");
  yellow = loadImage("yellow.jpg");
  blue = loadImage("blue.jpg");
  green2 = loadImage("green2.jpg");
  red2 = loadImage("red2.jpg");
  yellow2 = loadImage("yellow2.jpg");
  blue2 = loadImage("blue2.jpg");
}


void draw(){
  
  int currentTime = millis();


  if(currentTime > time2){
    x-=200;
  }else if(currentTime > time1){
  image(green, x, 0);
  image(red, 200+x, 0);
  image(yellow, 400+x, 0);
  image(blue, 600+x, 0);
  image(green2, 800+x, 0);
  image(red2, 1000+x, 0);
  image(yellow2, 1200+x, 0);
  image(blue2, 1400+x, 0);
  
//  ellipse(x, 60, 90, 90);
  currentTime = millis();

}
}


