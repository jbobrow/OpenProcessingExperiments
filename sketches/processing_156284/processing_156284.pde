
PImage heart;
int heartSize;
int xPos;
int yPos;
int speed;

void setup (){
  heart=loadImage("heart_PNG706.png");
  size(600,600);
  background(255,102,178);
  heartSize=100;
  xPos = 100;
  yPos= 100;
  speed =2;
}

void draw() {
 background(255,102,178);
 image(heart, xPos, yPos, heartSize, heartSize);
 xPos+=speed;
 yPos+=speed;
  
//  if (xPos+heartSize >= width ){
// speed*=-1;
//  }
  
  if (yPos+heartSize >= height){
    speed*=-1;
  }
  
  else if(yPos+heartSize<= height){
    speed;
  }
  
}
 



