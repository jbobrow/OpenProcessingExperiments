



float x = 200;                         // variables for position of one rectangle
float y = 100;
float z = 150;
float j = 50;
float h = 25;
float i = 5;
float m = 250;

float n = 105;
float o = 205;
float p = 155;
float q = 55;


float x1=100;                          // variables for position of one rectangle
float y1 = 100;
float z1=150;
float j1=50;
float h1=25;
float i1=20;
float m1=200;
float n1 = 105;
float o1 = 105;
float p1 = 255;
float q1 = 55;



float speed  =  3;                      // variables for speed of rectangles
float speed1 = 5;
float speed2 = 4;
float speed3 = 6;
float speed4 = 7;
float speed5 = 12;
float speed6 = 17;
float speed7 = 24;
float speed8 = 20;
float speed9 = 16;
float speed10= 11;



void setup () {
  size (300, 800);
}


void draw () {
  background (71,47,74);                   //make a "white" background

  fill (random(0,255));                      //color the rectangle
  noStroke () ;
  rectMode (CENTER);
  rect (x, y,10,50);
  rect (x1, y1,5,50);
  rect (z,z1,7,40);
  rect(j,j1,12,70);
  rect(h,h1,5,25);
  rect(i,i1,2,100);
  rect(m,m1,14,75);
  rect(n,n1,4,85);
  rect(o,o1,9,120);
  rect(p,p1,25,100);
  rect(q,q1,10,60);

  y = y+speed;                          //move the rectangles by adding speed
  y1=y1+speed1;
  z1=z1+speed2;
  j1=j1+speed3;
  h1=h1+speed4;
  i1=i1+speed5;
  m1=m1+speed6;
  n1=n1+speed7;
  o1=o1+speed8;
  p1=p1+speed9;
  q1=q1+speed10;


  if ((y>height-25) || (y<25)) {        //keep the rectangles from leaving the screen
    speed = speed *-1;
  }

  if ((y1>height-25) || (y1<25)) {
    speed1 = speed1 *-1;
  }

  if ((z1>height-25) || (z1<25)) {        //keep the rectangles from leaving the screen
    speed2 = speed2 *-1;
  }

  if ((j1>height-25) || (j1<25)) {
    speed3 = speed3 *-1;
  }

  if ((h1>height-25) || (h1<25)) {
    speed4 = speed4 *-1;
  }


  if ((i1>height-25) || (i1<25)) {
    speed5 = speed5 *-1;
  }

  if ((m1>height-25) || (m1<25)) {
    speed6 = speed6 *-1;
  }

  if ((n1>height-25) || (n1<25)) {
    speed7 = speed7 *-1;
  }

  if ((o1>height-25) || (o1<25)) {
    speed8 = speed8 *-1;
  }

  if ((p1>height-25) || (p1<25)) {
    speed9 = speed9 *-1;
  }

  if ((q1>height-25) || (q1<25)) {
    speed10 = speed10 *-1;
  }
}

