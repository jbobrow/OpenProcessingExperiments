
PImage eight;
PImage six;
PImage four;
PImage five;
int x=0;
int y=0;
int xspeed=2;
int yspeed=10;

void setup() {
  size (500,500);
  eight = loadImage("nature lab 8.jpg");
  six = loadImage("nature lab 6.jpg");
  four = loadImage("naure lab 4.jpg");
  five = loadImage("nature lab 5.jpg");
}
  
  void draw(){
    x=x+xspeed;
    y=y+yspeed;
    
   background(100);
    image(eight, 0, 0);
    tint(255,255,255,100);
    image(six,0,0);
    tint(255,255,255,50);
    image(four,0,0);
    tint(255,255,255,255);
    if (y>height){
    yspeed=yspeed*-1;
  } else if (y<0) {
    yspeed=yspeed*-1;}
    
  }

