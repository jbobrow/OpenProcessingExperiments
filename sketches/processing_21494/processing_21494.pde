
// variables for position of one rectangle
float x = 200;
float y = 100;

// variables for position of one rectangle
float x1=100;
float y1 = 100;

// variables for position of one rectangle
float x2 = 300;
float y2 = 100;

// variables for position of one rectangle
float x3 = 100;
float y3 = 100;

// variables for position of one rectangle
float x4 = 100;
float y4 = 200;

// variables for position of one rectangle
float x5 = 100;
float y5 = 300;

// variables for speed of rectangles
float speed = 3;
float speed1 = 5;
float speed2 = 10;
float speed3 = 3;
float speed4 = 5;
float speed5 = 10;

void setup () {
 size (400, 400);
}

void draw () {

 //make a "white" background
 background (240);

 //color the rectangle

 noStroke () ;
 rectMode (CENTER);

 fill(0,255,0);
ellipse (x, y, 50, 50);
 fill (255,0,0);
ellipse (x1, y1, 50, 50);
 fill (0,0,255);
ellipse (x2, y2, 50, 50);

 fill (0,0,220);
ellipse (x3, y3, 50, 50);
 fill (220,0,0);
ellipse (x4, y4, 50, 50);
 fill (0,220,0);
ellipse (x5, y5, 50, 50);

//move the rectangles by adding speed
 y = y+speed;
 y1=y1+speed1;
 y2=y2+speed2;
 x3=x3+speed3;
 x4=x4+speed4;
 x5=x5+speed5;

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
 
  if ((x3>width-25) || (x3<25)) {
 speed3 = speed3 *-1; 

 }
   if ((x4>width-25) || (x4<25)) {
 speed4 = speed4 *-1; 

 }  if ((x5>width-25) || (x5<25)) {
 speed5 = speed5 *-1; 

 }

}


