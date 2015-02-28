
int num = 10;
int[] x= new int[num];
int[] y= new int[num];
int speed = 10;
float ydirection = 1;
float xdirection = .6;




void setup() {
  size(600, 600);
  
}


void draw() {
  randomSeed(12);
  background(5);
  stroke(250);
  smooth();
 

  for (int i=0; i<num; i++) {
    x[i] = (int)random(600);
    y[i] = (int)random(600);


    ellipse(x[i], y[i], 20, 20);
    x[i]+=speed*xdirection;
    y[i]+=speed*ydirection;


    if (y[i]>height) {
      ydirection = -1;
      fill(random(256), random(256), random(256));
    }
    if (y[i]<=0) {
      ydirection = 1;
      fill(random(256), random(256), random(256));
    }
    if (x[i]>width) {
      xdirection = -.6;
      fill(random(256), random(256), random(256));
    }
    if (x[i]<=0) {
      xdirection = .6;
      fill(random(256), random(256), random(256));
    }
  }
}




/*void keyPressed() {
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


