
// get the rings
color[] pm = {#99cac9, #736a40, #bfb47e, #8c4e7e, #734668};

int w = 600;
int h = 600;

int x = 0;
int y = 0;
int d = 60;
int k;

float e  = .01;
float e2 = .03;
float e3 = .07;

float d1x = -250;
float d1y = -250;

float d2x = 250;
float d2y = -250;

float d3x = 250;
float d3y = 250;

void setup(){
  size(600,600);
  smooth();
  ellipseMode(CENTER);
  rectMode(CENTER);
  }

void draw(){
  translate(300,300);
  background(pm[0]);
  text("Use I, K, L, and J to move S to Stop", 10, 295);

// Chad 
  stroke(#FFFFFF);
  strokeWeight(4);
  fill(pm[1]);
  ellipse(x,y,d,d);
  
// dots
  stroke(#FFFFFF);
  strokeWeight(4);
  fill(pm[2]);
  ellipse(d1x,d1y,d-20,d-20);
  d1x += (x-d1x)*e;
  d1y +=(y-d1y)*e;
  
  stroke(#FFFFFF);
  strokeWeight(4);
  fill(pm[3]);
  ellipse(d2x,d2y,d-20,d-20);
  d2x += (x-d2x)*e2;
  d2y +=(y-d2y)*e2;
  
  stroke(#FFFFFF);
  strokeWeight(4);
  fill(pm[4]);
  ellipse(d3x,d3y,d-20,d-20);
  d3x += (x-d3x)*e3;
  d3y +=(y-d3y)*e3;
//move up
  if(k == 1){
    fill(pm[1]);
    ellipse(x,y,d,d);
    y -= 2;
   }
//move down
   if(k == 2){
     fill(pm[1]);
    ellipse(x,y,d,d);
   y += 2; 
    }
//move right
    if(k == 3){
      fill(pm[1]);
      ellipse(x,y,d,d);
      x += 2;
    }
//move left
 if(k == 4){
      fill(pm[1]);
      ellipse(x,y,d,d);
      x-= 2;
    }
if(d1x == x){
  noStroke();
  fill(#FFFFFF);
  rect(0,0,600,600);
  
  }
}

  void keyPressed(){
//up
    if(key == 105) k = 1;
//down
    if(key == 107) k = 2;
//right
    if(key == 108) k = 3;
//left
    if(key == 106) k = 4;
//stop
    if(key == 115) k = 0; 
  }
