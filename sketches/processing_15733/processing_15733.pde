

float angulo = 0.0;

int x =200;
int y =400;

void setup(){
  size(500, 500);
  smooth();
    noStroke();
}

void draw(){
  
  rectMode(CENTER);
  fill(0, 12);
  rect(width/2, height/2, width, height);
 
  angulo = angulo + 0.005;
  
  translate(width/2, height/2);
  fill(0,0,255,100);
  rotate(angulo);
  rect(0, 0, x, y);
 
  fill(255,255,0, 100);
  rotate(angulo);
  rect(0, 0, x, y);
  
  fill(0,255,0, 100);
  rotate(angulo);
  rect(0, 0, x, y);
  
  fill(255,0,0, 100);
  rotate(angulo);
  rect(0, 0, x, y);
  
  
  
  
  fill(0,0,255,100);
  rotate(angulo);
  rect(0, 0, x, y);
 
  fill(255,255,0, 100);
  rotate(angulo);
  rect(0, 0, x, y);
  
  fill(0,255,0, 100);
  rotate(angulo);
  rect(0, 0, x, y);
  
  fill(255,0,0, 100);
  rotate(angulo);
  rect(0, 0, x, y);
  
  
 
  
}
