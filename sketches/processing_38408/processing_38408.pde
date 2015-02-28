
// start somewhere in the top left 1/3 of the wall
//draw a point, move down one space and two spaces left or right, draw another point
//repeat these two steps until the floor is reached
//if the left edge is reached, start over
//decrease the line weight lower on the wall 
//stop when 20 lines are made

float x, y;

void setup() {
  size(600, 600);
  background(255);
  strokeWeight(2);
  smooth();
  frameRate(10000);
  x = random(0, width*1/3);
  y = 0;
}

float count = 0;
float num = 12000;

void draw() {
  if (count< num) {
    x = x + random(-2, 2);
    y = y +1;
    stroke(y/5);
    point(x, y); 
    //when the line reach the bottom or
    // the left edge a new line starts
    if ((y>=600)||(x<=0)) {
      y=0;
      x= random(0, width*1/3);
    }

    count++;
  }
}
//start over if moused is pressed
void mousePressed() {
  background(255);
  count=0;
  y=0;
}


