
int X;
int Y;
int X2;
int Y2;
int X3;
int Y3;
int X4;
int Y4;
int X5;
int Y5;
int directionX;
int directionY;
int directionX2;
int directionY2;
int directionX3;
int directionY3;
int directionX4;
int directionY4;
int directionX5;
int directionY5;
int colorValue;

//runs once
void setup(){
  size (600, 600);
  X = 100;
  Y = 250;
  X2 = 500;
  Y2 = 450;
  X3 = 50;
  Y3 = 0;
  X4 = 75;
  Y4 = 300;
  X5 = 25;
  Y5 = 50;
  colorValue = (1);
  
  directionX = 6;
  directionY = 6;
  directionX2 = 3;
  directionY2 = 3;
  directionX3 = 2;
  directionY3 = 2;
  directionX4 = 4;
  directionY4 = 4;
  directionX5 = 5;
  directionY5 = 5;
}


//runs every frame
void draw(){
  background(0);
  
  X += directionX;
  Y += directionY;
  X2 += directionX2;
  Y2 += directionY2;
  X3 += directionX3;
  Y3 += directionY3;
  X4 += directionX4;
  Y4 += directionY4;
  X5 += directionX5;
  Y5 += directionY5;

fill (colorValue);
colorValue++;

if(colorValue >255){
   colorValue = 24;
}

//first ball  
  if(Y > 600){
     directionY = -6;
  }   
  
  Y += directionY;
  if(Y < 0){
     directionY = 6;
  }  
  
  X += directionX;
  if(X > 600){
     directionX = -6;
  }   
  
  X += directionX;
  if(X < 0){
     directionX = 6;
  }  

//second ball
  if(Y2 > 600){
     directionY2 = -3;
  }   
  
  Y2 += directionY2;
  if(Y2 < 0){
     directionY2 = 3;
  }  
  
  X2 += directionX2;
  if(X2 > 600){
     directionX2 = -3;
  }   
  
  X2 += directionX2;
  if(X2 < 0){
     directionX2 = 3;
  }  
  
//third ball
if(Y3 > 600){
     directionY3 = -2;
  }   
  
  Y3 += directionY3;
  if(Y3 < 0){
     directionY3 = 2;
  }  
  
  X3 += directionX3;
  if(X3 > 600){
     directionX3 = -2;
  }   
  
  X3 += directionX3;
  if(X3 < 0){
     directionX3 = 2;
  }  
  
//fourth ball
if(Y4 > 600){
     directionY4 = -4;
  }   
  
  Y4 += directionY4;
  if(Y4 < 0){
     directionY4 = 4;
  }  
  
  X4 += directionX4;
  if(X4 > 600){
     directionX4 = -4;
  }   
  
  X4 += directionX4;
  if(X4 < 0){
     directionX4 = 4;
  }  
  
//fifth ball
if(Y5 > 600){
     directionY5 = -5;
  }   
  
  Y5 += directionY5;
  if(Y5 < 0){
     directionY5 = 5;
  }  
  
  X5 += directionX5;
  if(X5 > 600){
     directionX5 = -5;
  }   
  
  X5 += directionX5;
  if(X5 < 0){
     directionX5 = 5;
  }  
  
  smooth();
//ball 1
  fill(colorValue, 50, colorValue);
  //fill(51, 240, 80);
  ellipse(X, Y, 50, 50);
//ball 2  
  fill(colorValue, 100, colorValue);
  //fill(62, 91, 234);
  ellipse(X2, Y2, 60, 60);
//ball 3  
  fill(colorValue, 150, colorValue);
  //fill(219, 234, 62);
  ellipse(X3, Y3, 70, 70);
//ball 4 
  fill(colorValue, 200, colorValue);
  //fill(234, 88, 62);
  ellipse(X4, Y4, 80, 80);
//ball 5 
  fill(colorValue, 250, colorValue);
  //fill(234, 88, 62);
  ellipse(X5, Y5, 90, 90);
}

