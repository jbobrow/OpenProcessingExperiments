

float x =50 ;
float y= 250;
float y1= 100;
float a=25 ; 
float b=50;



float speed= .3;
float speed1=.5;
float speed2 = 2;
float speed3= .6;

void setup () {
  size ( 500, 500);
  background (0); 
  smooth();
}  
void draw() {
  int r=int (random ( 10,70));

  fill(61,238,14,20);

  //1st circle
  rectMode (CENTER);

  ellipse ( x, y, r,r);
  //motion
  x=x + speed;
  if ((x>width-20) || (x<20)) {
    speed = speed *-1;
  }

  //2nd big pimk ball
  fill (240,16,232,20);
  // y is now hooked to the radius
  for (int i =1; i <5; i++) {
    ellipse (width/2, height/2, y1, y1);
  }
  //change the radius
  y1 = y1+speed2;
  ;
  //keep the circle from leaving the screen
  if ((y1>height) || (y1<50)) {
    speed2 = speed2 *-1;
  }
}          
                
