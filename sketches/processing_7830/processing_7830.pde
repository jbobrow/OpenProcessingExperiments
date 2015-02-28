

import processing.pdf.*; 

boolean savepdf;//converts savepdf into boolean

//values
int x = 400;//set a starting point
int y = 150;//sets the ending point
int direction = 0; 
int range = 100; //controls the higher size of the line
int lower_range = 90;
int counter = 5;

void setup(){

  size(1000,400);
  background(255);
  frameRate(10);
  beginRecord(PDF,"Lines.pdf");
}

void draw(){

  counter++;//activates counter

  int xend = int(random(lower_range,range+counter));//The value (int), in this case length, of the x line is value(int) 30-100 +1 
  int yend = int(random(lower_range+counter,lower_range));//The value (int), in this case length, of the y line is value(int) 30-30 +1

  if (direction == 0) {//direction is equal to zero
    yend = 0;//

  }
  if (direction == 1) {
    xend = 0;// if the direction is one make the line begin at end of x 

  }
  if (direction == 2) {//0 direction is equal to direction 2 
    yend = 0;// make y the starting point
    xend = xend * -1;//make the line head along x, creates negative
  }

  if (direction == 3) {
    xend = 0;
    yend = yend * -1;//make the line head along x, creates negative
  }

  line(x,y,x+xend,y+yend);//draws line according to 
  stroke(0); //line colour
  strokeWeight(1.5); //line weight

  direction = direction + 1;// 0 = 0 plus 1
  if (direction == 4) direction = 0;// turns direction 4 into direction 0 to start the process again.

  x = x+xend;
  y = y+yend;
}


void mousePressed() {
  endRecord();
}


