
float x, y;
float x2, y2;
float x3, y3;
float x4, y4;
float x5, y5;
float spdX, spdY;
float spdX2, spdY2;
float spdX3, spdY3;
float spdX4, spdY4;
float spdX5, spdY5;
float r;
color blue = color(59, 158, 255);
color purple = color(88, 59, 255);
color green = color(3, 167, 89);


void setup(){
  size(400, 400);
  background(255);
  spdX = 4;
  spdY = 5;
  spdX2 = 2.5;
  spdY2 = .05;
  spdX3 = 2;
  spdY3 = 2.5;
  spdX4 = 1.3;
  spdY4 = .9;
  spdX5 = 3.5;
  spdY5 = 4.1;
  r = 20;
  x2 = 150;
  x3 = 230;
  x4 = 200;
  x5 = 270;
  polyStar(x, y, 5, 50, 80, 255, 0, 2, 0.0);
}

void draw(){
  background(255);
  fill(0);
  
  polyStar(width-x, y, 5, 20, 30, blue, blue, 2, 0.0);
  
  polyStar(x2, y2, 5, 20, 30, purple, purple, 2, 0.0);
  
  polyStar(x3, y3, 5, 15, 20, blue, blue, 2, 0.0);
  
  polyStar(x4, y, 5, 20, 30, green, green, 2, 0.0);
  
  polyStar(x5, y2, 5, 15, 20, green, green, 2, 0.0);
  
  
  spdY2+=1.01;
  spdY5+=9;

  x+=spdX;
  y+=spdY;
  x2+=spdX2;
  y2+=spdY2;
  x3+=spdX3;
  y3+=spdY3;
  x4+=spdX4;
  y4+=spdY4;
  x5+=spdX5;
  y5+=spdY5;
  
  
  //stop at bottom of screen//
  if(spdY2<.001){
    spdX2=0;
  }
  if(spdY5<.001){
    spdX5=0;
  }
  
  //flashingstar//
  if(spdY5<=0){
    polyStar(x5, y2, 5, 15, 20, purple, purple, 2, 0.0);
  }
  
  if(spdY3>=0){
    polyStar(x3, y3, 5, 15, 20, purple, purple, 2, 0.0);
  }
 
  
  //bounce off walls//
  if(x>width-r){
    x=width-r;
    spdX*=-1;
  }
  if(x2>width-r){
    x2=width-r;
    spdX2*=-1;
  }
  if(x3>width-r){
    x3=width-r;
    spdX3*=-1;
  }
  if(x4>width-r){
    x4=width-r;
    spdX4*=-1;
  }
  if(x5>width-r){
    x5=width-r;
    spdX5*=-1;
  }
  
  
  if(x<0+r){
    x=0+r;
    spdX*=-1;
  }
  if(x2<0+r){
    x2=0+r;
    spdX2*=-1;
  }
  if(x3<0+r){
    x3=0+r;
    spdX3*=-1;
  }
  if(x4<0+r){
    x4=0+r;
    spdX4*=-1;
  }
  if(x5<0+r){
    x5=0+r;
    spdX5*=-1;
  }
  
  
  if(y>height-r){
    y=height-r;
    spdY*=-1;
  }
  if(y2>height-r){
    y2=height-r;
    spdY2*=-1;
  }
  if(y3>height-r){
    y3=height-r;
    spdY3*=-1;
  }
  if(y4>height-r){
    y4=height-r;
    spdY4*=-1;
  }
  if(y5>height-r){
    y5=height-r;
    spdY5*=-1;
  }
  if(y<0+r){
    y=0+r;
    spdY*=-1;
  }
  if(y2<0+r){
    y2=0+r;
    spdY2*=-1;
  }
  if(y3<0+r){
    y3=0+r;
    spdY3*=-1;
  }
  if(y4<0+r){
    y4=0+r;
    spdY4*=-1;
  }
  if(y5<0+r){
    y5=0+r;
    spdY5*=-1;
  }
  /*if the ball's x position is greater than teh right side
  move to the boundary
  reverse velocity vector*/
  
}

