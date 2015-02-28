
/* @pjs font="Playball-Regular.ttf" ; */

int x = 0 ;
int y = 700 ;
int z = -400 ;
int a = 1700 ;
int b = 1211 ;
int c = -1498 ;



PFont playball ;
PImage myImage ;


void setup() { 
  size(640, 640);
  
  myImage = loadImage("sky.jpg");
  
  playball = createFont("Playball-Regular.ttf", 20);
  textFont(playball, 40);
  
  
  
}

void draw() {
  noStroke();
  background(100);
  
  image(myImage, 0, 0, 640, 640) ;
  
  fill(#FFEA00);
  ellipse( 500, 100, 150, 150);
  
  fill(255);
  ellipse( x, 100, 80, 50);
  ellipse( x-26, 82, 50, 50);
  ellipse( x, 80, 50, 50);
  ellipse( x+20, 100, 60, 60);
  ellipse( x-23, 105, 45, 40);
  ellipse( x+60, 100, 80, 50);
  ellipse( x+34, 82, 50, 50);
  ellipse( x+60, 80, 50, 50);
  ellipse( x+80, 100, 60, 60);
  ellipse( x+37, 105, 45, 40);
  
  ellipse( y, 250, 80, 50);
  ellipse( y-26, 232, 50, 60);
  ellipse( y, 230, 60, 50);
  ellipse( y+20, 250, 60, 60);
  ellipse( y-24, 255, 45, 50);
  ellipse( y+60, 250, 30, 50);
  ellipse( y+34, 232, 50, 50);
  ellipse( y+60, 230, 50, 60);
  ellipse( y+80, 250, 30, 60);
  ellipse( y+37, 255, 45, 60);
  
x++;

if (x > 700) {
  x = -120 ; }
  


y = y - 1;

if (y < -400) {
  y = 700 ; } 
  fill(#111050);
  text("And I will question every wind", 250, z , 180, 1000) ;
  textSize(60);
  text("if they gone through the glow of your eyes", a, 30, 1000, 1000);
  text("Oh, you're just a riddle in the sky", 115, b, 500, 1000);
  text("Oh, where do my bluebirds fly?", 130, c, 500, 500);

  a = a - 3 ;
  
  b = b - 1 ;
  
  c = c + 1 ;
  

  
  z = z + 2 ;
  
  

  
}








