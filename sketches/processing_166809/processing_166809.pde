
import processing.opengl.*;
Circle[][] c1 = new Circle[10][10]; 


void setup(){
  size(500, 500, OPENGL);
  colorMode(HSB, 360);
  background(0);
  smooth();
  blendMode(ADD);
  
  for(int x = 0; x < c1.length; x ++){
    for(int y = 0; y < c1.length; y++){
      c1[y][x] = new Circle();
    }
  }

}

void draw(){
  background(0);
  fill(359,100);
  
  for(int x = 0; x < c1.length; x ++){
    for(int y = 0; y < c1.length; y++){
      c1[y][x].drawA();
      c1[y][x].drawB();
      c1[y][x].drawC();
    }
  }
    
}

  

class Circle
{
  float eSize;
  float eSpeed;
  float minSize;
  float maxSize;
  float eX;
  float eY;
  float hColor;
  float sColor;
  float bColor;
  float alph;
  float zxSpeed;
  float zySpeed;
  float g,ax,ay;
  float centerX,centerY;
  float friction;

  

Circle()
{
  minSize = 1.0;
  maxSize = 50.0;
  eSize = random(minSize, maxSize);
  eSpeed = random(0.01, 1.5);
  eX = 250;
  eY = 400;
  hColor = random(10,350);
  sColor = random(280,300);
  bColor = random(300,360);
  alph = random(100, 300);
  zxSpeed = random(-2, 2);
  zySpeed = random(0.5, 6);
  g = 0.5;
  friction = 0.05;
}

void drawA()
{
  noStroke();
  fill(hColor, sColor, bColor,alph);
  ellipse(eX, eY, eSize, eSize);
  eY -= zySpeed; 
}

void drawB()
{
  if(eY < 300){
    eX += zxSpeed; 
    zySpeed += -friction;
  }
}

void drawC()
{
 if(eY > 500){
  eY = 400;
  eX = 250;
  zySpeed = random(2, 7);
 } 
}

}



