
float circleY;
float circleX;
float Yvel=5;
float Xvel=2;

void setup(){
  
  size(500,500);
  smooth();
  background(255);
  
}

void draw(){
  
  circleY=circleY+Yvel;
  circleX=circleX+Xvel;
  
  PImage rastanyan = loadImage("rastanyan.png");
  image(rastanyan,circleX+340,circleY-20);
  
  PImage americanyan = loadImage("americanyan.png");
  image(americanyan,circleX+250,circleY-20);
  
  PImage mexicannyan = loadImage("mexicannyan.png");
  image(mexicannyan,circleX+140,circleY-20);
  
  PImage metalnyan = loadImage("metalnyan.png");
  image(metalnyan,circleX+60,circleY-20);
  
  PImage nyan = loadImage("nyan.png");
  image(nyan,circleX-20,circleY-20);
  
    if((circleY<0)||(circleY>height)){
    Yvel=Yvel*-1;
  }
    
  if((circleX<0)||(circleX>width)){
    Xvel=Xvel*-1;
  }
  
}  


