
int x=250;
int y=0;
int speed = 10;
float ydirection = 1;
float xdirection = .6;
int paddleS = 40;


void setup() {
  size(600, 600);
  noCursor();
}


void draw() {
  background(5);
  stroke(250);
  strokeWeight(4);
  smooth();


  line(mouseX-paddleS, 580, mouseX+paddleS, 580); //draw paddle

  noStroke();
  ellipse(x, y, 50, 50); //draw bouncing ball
  y+=speed*ydirection;
  x+=speed*xdirection;

 
 
  if (y>555) {
    if (x>=(mouseX-paddleS) && x<=(mouseX+paddleS)) { //if it hits paddle
      ydirection = -1;
      fill(random(256), random(256), random(256));
    }
  }

 if (y>600) {
    for (int i=0; i<=300; i++) {
      y=height/2;
      x=width/2;
    }
  }
 

  if (y<=0) {//when it hits top
    ydirection = 1;
    fill(random(256), random(256), random(256));
  }
  if (x>width) {//when it hits right
    xdirection = -.6;
    fill(random(256), random(256), random(256));
  }
  if (x<=0) {//when it hits left
    xdirection = .6;
    fill(random(256), random(256), random(256));
  }
}







/*void keyPressed() { //makes x-direction controllable
 if (key == CODED) {
 if (keyCode == LEFT) {
 x-=20;
 if (x<=0) {
 x=0;
 }
 } 
 else if (keyCode == RIGHT) {
 x+=20;
 if (x>=width) {
 x=width-20;
 }
 }
 }
 }*/


