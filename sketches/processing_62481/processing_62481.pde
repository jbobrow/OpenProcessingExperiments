
float r = 0;
PImage bgImg;
float triangleX = 0;
float triangleY = 0;
float triangle2X = random(373);
float triangle2Y = random(373);
float triangle3X = random(373);
float triangle3Y = random(373);
float triangle4X = random(373);
float triangle4Y = random(373);
float targetX = 0;
float targetY = 0;
int fillColor = 0;

void setup(){
  size(573,573);
  bgImg = loadImage("drmaze3.png");
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  
}
 
void mousePressed(){
  triangle2X = random(373);
  triangle2Y = random(373);
  triangle3X = random(373);
  triangle3Y = random(373);
  triangle4X = random(373);
  triangle4Y = random(373);
  
  fillColor = (int)random(256);
  
}
  
void draw (){
  
  fill(0,20);
  background(bgImg);
  noStroke();
  fill(fillColor,100,100,100);
  
  targetX = mouseX;
  targetY = mouseY;
  
  triangleX += (targetX-triangleX) *.05;
  triangleY += (targetY-triangleY) *.05;

  triangle(triangleX, triangleY, triangleX +15, triangleY +15, triangleX -10, triangleY +10);
  
  translate(triangle2X+100,triangle2Y+100);
  rotate(r/2);
  triangle(0,0,50,100,100,50);
  resetMatrix();
   
  translate(triangle3X+100,triangle3Y+100);
  rotate(r*1.5);
  triangle(0,0,50,100,100,50);
  resetMatrix();
  
  translate(triangle4X+100,triangle4Y+100);
  rotate(r*3);
  triangle(0,0,50,100,100,50);
  resetMatrix();
  
  r+=PI/128;
  
}


