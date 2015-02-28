
//Hw5 Kevin Kan
//Copyright 2014

//figure1
float x1, y1, dx1, wd1, ht1;

//figure2
float x2, y2, dx2, wd2, ht2;


void setup(){
  size(400, 400);
  //figure1
  x1=10;
  y1=10;
  wd1=20;
  ht1=20;
  dx1=4;
  
  //figure2
  x2=380;
  y2=380;
  wd2=40;
  ht2=40;
  dx2=5;
  
}

void draw(){
  prepareWindow();
  drawFigure();
  moveFigure();
}

void prepareWindow(){
  fill(0,200,100,100);
  rect(0,0,400,400);
}

void figure(float a, float b, float c, float d){
  noStroke();
  fill(255,255,255);
  ellipse(a, b, c, d);
}

void drawFigure(){
  figure(x1, y1, wd1, ht1);
  figure(x2, y2, wd2, ht2);
}

void moveFigure(){
  //figure1
  x1 = x1 + dx1;
  if (x1>width-10){
    y1 = y1 +dx1;
    x1 = width-10;
   }
  if (y1 > height-10){
    dx1 = -dx1;
    x1 = x1-dx1;
    y1 = height-10;
  }
  if (x1<10){
    y1 = y1+dx1;
    x1 = width-390;
  }
  if (y1 < 10){
    dx1=-dx1;
    x1 = x1+dx1;    
    y1=10;
  }
  
  //figure2
  if(y2==380){
    x2=x2-dx2;
  }
  if ((x2==20) && (y2==380)){
    y2=y2-dx2;
    x2=20;
  }
  if ((x2==20) && (y2<380)){
    y2=y2-dx2;
    x2=20;
  }
 if ((x2==20) && (y2==20)){
   x2=x2+dx2;
   y2=20;
 }
 if ((x2>20) && (y2==20)){
   x2=x2+dx2;
   y2=20;
 }
 if ((x2==380) && (y2==20)){
   y2=y2+dx2;
   x2=380;
 }
 if ((x2==380) && (y2>20)){
   y2=y2+dx2;
   x2=380;
 }
}


