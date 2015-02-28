
float x1= 280;  //x location
float y1=300; // y location
float x2= 280;  //x location
float y2=200; // y location
float speed = 15;
float speed2 = -15;


void setup() {
  frameRate (10); // set a slow framerate
  size (500, 500);
}
void draw () {
  background (101,97,97);
  move1 (); //create separate functions
  move2 (); //create separate functions
  bounce (); //create separate functions
  bounce2 (); //create separate functions
//  display();
  drawCar (x1, y1, 64, color (100, 40, 100)) ;
  drawCar (x2, y2, 64, color (80, 200, 200)) ;


  //lines punteadas in the top
  noStroke();
  fill (252,255,0);
  for(int h=16; h<=height; h+=30) {
    rect(h,250,15,3);
  }
  rectMode(CENTER);
  fill (54,164,30);
  rect(width/2,0,width,290);

  rect(width/2,500,width,290);
}


///////////////////////////////////////////////
void move1 () {
  x1 = x1 +speed; //add speed to y location
}

void move2 () {
  x2 = x2 +speed2; //add speed to y location
}

void bounce () {
  if ((x1>width+100) || (x1<-100)) {
    speed = speed * -1;
  }
}

void bounce2 () {
  if ((x2>width+100) || (x2<-100)) {
    speed2 = speed2 * -1;
  }
}
void display () {
  drawCar (x1, y1, 64, color (200, 200, 0)) ;
  drawCar (x2, y2, 64, color (200, 200, 0)) ;
}


void drawCar (float x, float y, float thesize, color c) {
  float offset = thesize/4; //position of wheels relative to car
  //draw main car body
  rectMode (CENTER);
  stroke (0);
  fill (c); // control the color with a variable
  rect (x, y, thesize, thesize/2);
  // draw four wheels relative to center
  fill(0);
  rect (x-offset, y-offset, offset, offset/2);
  rect (x+offset, y-offset, offset, offset/2);
  rect (x-offset, y+offset, offset, offset/2);
  rect (x+offset, y+offset, offset, offset/2);
}


