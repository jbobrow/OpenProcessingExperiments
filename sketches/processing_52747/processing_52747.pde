
 /*****************************************
 * Assignment 03
 * Name:         Zhen Xu
 * E-mail:      zxu01@brynamwr.edu
 * Course:       CS 110 - Section 02
 * Submitted:    14th. Feb(V-day)
 * 
 * This is an iconic shape.
 
 ***********************************************/ 
int alpha = 50, inc = 1;
float speed = 0.0;
int m=20;
int n=20;

void setup() {
  size(600, 600);
  noStroke();
  drawCircle(width/2, height/2, 200);
  drawGrid(m,n);
}
void draw() { 
  //draw a big star
  fill(0);
  beginShape();
  vertex(300, 20);
  vertex(380, 200);
  vertex(580, 200);
  vertex(400, 350);
  vertex(530, 580);
  vertex(300, 430);
  vertex(70, 580);
  vertex(200, 350);
  vertex(20, 200);
  vertex(220, 200);
  endShape();

  alpha = (alpha + inc);
  if (alpha > 255 || alpha < 50)
    inc = inc*-1;
  fill (255, alpha);

  speed = speed+0.001;
  star (width/2, height/2, 50, speed, 5);
}

//draw circles
void drawCircle(int centerx, int centery, int radius) {
  int steps = 15;

  float angle = 2*PI/steps;
  for (int i=0; i<steps; i++) {
    float x = cos(angle*i)*radius + centerx;
    float y = sin(angle*i)*radius + centery; 
    fill(255);
    ellipse(x, y, 10, 10);
  }
}
//draw the rotating star
//quote from the class example
void star ( int cx, int cy, float radius, float start, int n) {
  float delta = 2*PI/n;
  float idelta = delta/2;
  float iRadius = radius/2;
  float theta = start;

  beginShape();
  for (int i = 0; i < n; i++ ) {
    vertex(cx + radius*cos(theta), cy + radius*sin(theta));
    vertex(cx + iRadius*cos(theta+idelta), cy + iRadius*sin(theta+idelta));
    theta = theta + delta;
  }
  endShape(CLOSE);
}
  
  void drawGrid(int m,int n){
    stroke(255);
    for(int y=0;y<height;y+=height/m){
      line(10,y,width,y);
    for(int x=0;x<width;x+=width/n){
    line(x,0,x,height);
    }  
    }
  }  



