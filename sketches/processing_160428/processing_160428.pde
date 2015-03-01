
int x;
int xSpeed;
int circleSize;

 
void setup() {
  size(1280, 720);
  x = 20;
  xSpeed = 10;
  circleSize = x;
}
 
 
void draw() {
 
  //Draw stuff
  background(255);
  fill(0, 0, 0);
 
  x+=xSpeed;
  ellipse(x, height/2, circleSize, circleSize);
 
}

//Pause Circle

void mousePressed() {
  if (mouseButton==LEFT) {
    xSpeed=0;}
    else {
      xSpeed=-1;
    }
 { //Impact with either wall
  if ( x>=width-(circleSize/2) || x <= circleSize/2 ) ;
 }

}
 
 
 
/*
Base code by Anthony Marefat.
*/






