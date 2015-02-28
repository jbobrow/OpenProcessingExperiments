
float positionX=1;
float positionY=2;
float speedX=3;
float speedY=4;


void setup(){
size(500,500);

}



void draw(){
  background(255,255,255);
 ellipse(positionX,positionY,50,50);
positionX=positionX+speedX;
positionY=positionY+speedY;
if (positionX>width){
speedX=-speedX;
}
if (positionY>height){
  speedY=-speedY;
}
if (positionX<0){
  speedX=-speedX;
}
if (positionY<0){
  speedY=-speedY;
}
  
}

