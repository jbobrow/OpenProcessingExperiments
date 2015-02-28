
float circleY;
float circleX;
float Yvel=5;
float Xvel=2;

void setup(){
  
  size(500,500);
  smooth();
  
  
}

void draw(){
  
  fill(random(25,155),random(25,155),random(25,155),random(25,155));
  noStroke();
  background(255);
  
  circleY=circleY+Yvel;//same as circley=+vel
  circleX=circleX+Xvel;//same as circley=+vel
  PImage nyan = loadImage("nyan.png");
  image(nyan,circleX,circleY);
  
  if((circleY<0)||(circleY>height)){
    Yvel=Yvel*-1;//same as vel*=-1
  }
    
  if((circleX<0)||(circleX>width)){
    Xvel=Xvel*-1;//same as vel*=-1
  }
  
}  


