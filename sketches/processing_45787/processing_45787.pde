
/////////////////////////////////////////////
// Author: Alex Hollander, 8/25/11 Fractlas//
/////////////////////////////////////////////

float ax=-.8;
float ay=.8;

void setup() {
  size(400,400);
  background(25);
  float h = random(100); //gives the hue, saturation, and brightness
  float s = random(100); // random properties
  float b = random(255);
  stroke(h,s,b);
  smooth();
  recfun(width/2,height,-HALF_PI,8); // recfun = recursive function
}

void draw() {
}

void recfun(float x,float y, float a, int c) { //defining recfun
  float nx=x+50*cos(a);
  float ny=y+50*sin(a);
  line(x,y,nx,ny);
  if (c>0) {
    recfun(nx,ny,a+ax,c-1);
    recfun(nx,ny,a+ay,c-1);
  }
}

void mousePressed() { // when the mouse is pressed a new design will be 
  float h = random(175);//emerge
  float s = random(150); 
  float b = random(150);
  stroke(h,s,b);
  background(25);
  ax=random(-PI,PI);
  ay=random(-PI,PI);
  recfun(width/2,(height/3)*2,-HALF_PI,8);
}

                
                                
