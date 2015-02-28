
//Adam Oaks

PImage myPic;

void setup(){
  size(300,300);
  myPic = loadImage("ind.jpg");
  frameRate(20);
  noStroke();
  smooth();
  
  background(255);
}

void draw(){
  rectMode(CENTER);
  fill(255,10);
  rect(width/2,height/2,width,height);
  
  int x = mouseX;
  int y = mouseY;
  float rectSize = random(10,60);
  
  color myColor = myPic.get(x,y);
  fill(myColor);
  rect(mouseX,mouseY,rectSize,rectSize);
}

