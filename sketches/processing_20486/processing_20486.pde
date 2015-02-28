

PImage myPic;

void setup(){
  size(300,300);
  myPic = loadImage("frankStella3.jpg");

  noStroke();
  smooth();
frameRate(10);
  background(230);
  rectMode(CENTER);
}


void draw(){
  float PRand = 5; 
float xpos=150;
float ypos=150;
  int t=300;
  t++;
  fill(255,50);
  rect(150,150,t,t);
  int y = floor(random(0,myPic.width));   
  int x = floor(random(0,myPic.height));  


xpos++;
  color myColor = myPic.get(x,y);      
  fill(myColor);
rect(xpos+=floor(random(-PRand,PRand)),ypos+=floor(random(-PRand,PRand)),random(40,width),random(40,width));
}







