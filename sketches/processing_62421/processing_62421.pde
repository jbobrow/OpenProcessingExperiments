
// Lab 4, Question 01
// Name: Jordan Michnoff
// Time to Complete: 45 minutes

float g1,g2;
float x, y, dx, dy;
float rectangle = 25;
float space = 100;

float distance(float x1, float y1, float x2, float y2){
  dx=x2-x1;
  dy=y2-y1;
  return sqrt((dx*dx)+(dy*dy));
}

void setup(){
  size(500,500);
  smooth();
  noStroke();
  rectMode(CENTER);
  
  x=width/2;
  y=height/2;
}

void draw(){
  g1 = random(0,255);
  g2 = random(0,255);
  background(g1);
  fill(g2);
  
  rect(x,y,rectangle,rectangle); // Creates rectangle
  
  // The following 4 "if" statements control the movement of the
  // square in relationship to the coordinates of the mouse.
  
  if (distance(x,y,mouseX,mouseY)<space && mouseY<y+rectangle){
    y+=20;
  }
  if (distance(x,y,mouseX,mouseY)<space && mouseY>y-rectangle){
    y-=20;
  }
  if (distance(x,y,mouseX,mouseY)<space && mouseX<x+rectangle){
    x+=20;
  }
  if (distance(x,y,mouseX,mouseY)<space && mouseX>x-rectangle){
    x-=20;
  }
  
  // The following 4 "if" statements keep the rectangle from leaving
  // the canvas of the sketch.

  if (y > height){
    y-=250;
  }
  if (y < 0){
    y+=250;
  }
  if (x > width){
    x-=250;
  }
  if (x < 0){
    x+=250;
  }
}

