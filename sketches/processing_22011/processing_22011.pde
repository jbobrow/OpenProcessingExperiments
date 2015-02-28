
// variables for position of one rectangle
float x = 200;
float y = 100;
float z = 200;
float o = 10;
// variables for position of one rectangle
float x1 = 100;
float y1 = 100;
// variables for position of one rectangle
float x2 = 300;
float y2 = 100;
// variables for speed of rectangles
float speed = 3;
float speed1 = 5;
float speed2 = 1;
float speed3 = 5;
float speed4 = 5;
void setup () {
  size (600, 600);
}

void draw () {

  //make a "blk" background
  background (0);
  //color the circle 
  fill (z, 5, 155-z);
  noStroke () ;

  // y is now hooked to the radius
  for (int i =1; i < 5; i++) {

    ellipse (width/2, height/2, z, z);
    ellipse (0, 0, o, o);
    ellipse (600,600,o,o);
  }
  //change the radius
  z = z+speed3;
  
  o = o+speed4;
  

  //keep the circle from leaving the screen
  if ((y>height) || (y<300)) {
    speed3 = speed3 *-1;
    speed4 = speed4 *-1;
  }
  //color the rectangle

  noStroke () ;
  rectMode (CENTER);
  fill (0);
  ellipse (x, y, 50, 50);
  ellipse (x1, y1, 50, 50);
  ellipse (x2, y2, 50, 50);
  ellipse (x+100,y,100,100);
  ellipse (x1+300,y1,100,100);
  //move the rectangles by adding speed
  y = y+speed;
  y1=y1+speed1;
  y2=y2+speed2;

  //keep the rectangles from leaving the screen
  if ((y>height-25) || (y<25)) {
    speed = speed *-1;
  }

  if ((y1>height-25) || (y1<25)) {
    speed1 = speed1 *-1;
  }

  if ((y1>height-25) || (y1<25)) {
    speed2 = speed2 *-1;
  }
}


