
float posX,posY;
float speedX,speedY;
float dim;

void setup(){
 size(600,600);
 colorMode(HSB,360);
 posX = 0;
 posY = 0;
 speedX = 6;
 speedY = 9;
 dim = 20;
}

void draw(){
  background(0);
  ellipse(posX,posY,dim,dim);
  update();
}

void update(){
  posX = posX+speedX;
  posY = posY+speedY;
  if(posX>width){
    posX = width;
    speedX=-speedX;
  }else if(posX<0){
    posX=0;
    speedX=-speedX;
  }
  if(posY>height){
    posY=height;
    speedY=-speedY;
  }else if(posY<0){
    posY=0;
    speedY=-speedY;
  }
}
