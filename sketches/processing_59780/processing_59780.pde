
float x1;
float y1;
float x2;
float y2;
float x3;
float y3;
float x4;
float y4;
float x5;
float y5;
float x6;
float y6;
float x7;
float y7;
float x8;
float y8;



void setup(){
  size(600,600);
  background(0);
  frameRate(60);
  x1 = 400;
  y1 = 400;
  x2 = 400;
  y2 = 400;
  x3 = 400;
  y3 = 400;
  x4 = 400;
  y4 = 400;
  x5 = 400;
  y5 = 400;
  x6 = 400;
  y6 = 400;
  x7 = 400;
  y7 = 400;
  x8 = 400;
  y8 = 400;
}
  

void draw(){
  x1 = x1+ random(-8,4);
  y1 = y1 +random(-5, 5);
  x3 = x3+random(-7,7);
  y3 = y3+random(-8,8);
  x5 = x5+random(-6,6);
  y5 = y5+random(-6,6);
  x7 = x7+random(-6.5,6.5);
  y7 = y7+random(-8,8);

  x1 = constrain(x1,0,width);
  y1 = constrain(y1, 0, height);
  x3 = constrain(x3, 0, width);
  y3 = constrain(y3,0,height);
  x5 = constrain(x5, 0, width);
  y5 = constrain(y5, 0, height);
  x7 = constrain(x7, 0, width);
  y7 = constrain(y7, 0, height);
  

  stroke(128);
  line(x1, y1, x2, y2);
  
  stroke(255);
  line(x3,y3,x4,y4);
  
  stroke(188,187, 186, 255);
  line(x5, y5, x6, y6);
  
  stroke(196, 193, 192, 200);
  line(x7, y7, x8, y8);
  
  x2 = x1;
  y2 = y1;
  x4 = x3;
  y4 = y3;
  x6 = x5;
  y6 = y5;
  x8 = x7;
  y8 = y7;
  
}
  

  
 

