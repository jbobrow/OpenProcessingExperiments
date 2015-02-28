
float circleX=0;
float circleY=0;
float cirX=20;
float cirY=20;
float speed=10;
void setup(){
  size(400,400);
  noStroke();
  frameRate(60);
  background(0);
  smooth();
}



void draw(){
  
  //if (mousePressed)background(0);
  
  fill(random(100,255),random(130,255),random(100,255),50);
  ellipse(circleX,circleY,cirX,cirY);
  cirX+=0.5;
  cirY+=0.5;
  
  circleX=circleX+speed;
  if (circleX>400 || (circleX<0)){
    speed =speed*-1.09;
    circleY+=20;
  } 
 
  
  
}


