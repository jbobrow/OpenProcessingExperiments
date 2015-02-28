
// variables for position of one rectangle
float x = 200;
float y = 100;

// variables for position of one rectangle
float x1=100;
float y1 = 100;

// variables for position of one rectangle
float x2=150;
float y2 = 100;

// variables for position of one rectangle
float x3=80;
float y3 = 100;

// variables for position of one rectangle
float x4=80;
float y4 = 100;

// variables for speed of rectangles
float speed = 7;
float speed1 = 5;
float speed2 = 8;
float speed3 = 4;
float speed4 = 4;

void setup () {
 size (400, 400);
}

void draw () {

 //make a "white" background
 background (20,25,39);

 //color the rectangle
 fill (0,120,96);
 noStroke () ;
 rectMode (CENTER);

 ellipse (x, y, 50, 50);
 ellipse (x1, y1, 20, 20);
  fill (0,120,180);
 ellipse (x2, y2, 30, 30);
 ellipse (x3, y3, 20, 20);
  ellipse (x4, y4, 20, 20);

//move the rectangles by adding speed
 y = y+speed;
 y1=y1+speed1;
 y2=y2+speed2;
  y3 = y3+speed;
  
    x4 = x4+speed;

//keep the rectangles from leaving the screen
 if ((y>height-25) || (y<25)) {
 speed = speed *-1; 

 }

 if ((y1>height-25) || (y1<25)) {
 speed1 = speed1 *-1; 

 }
 
  if ((y2>height-25) || (y2<25)) {
 speed2 = speed2 *-1; 

 }
   if ((y3>height-25) || (y3<25)) {
 speed3 = speed3 *-2; 

 }
 
    if ((x4>width-25) || (x4<25)) {
 speed4 = speed4 *-2; 

 }

}

