
int circleX = 30;
int circleY = 200;
int velX = 10;
int velY = 10;
int rad = 60;

//float r,g,b;

void setup(){
  size(400, 400);
  frameRate(60);
}

void draw(){
  background(82, 210, 255);
  fill(33, 33, 33);
  noStroke();
  smooth();  
  ellipse(circleX, circleY, rad, rad);
  
  circleY = circleY + velY;
  circleX = circleX + velX;
  
  if(circleY >= width-10 || circleY <= 0){ 
      velY = -velY;
   }else if(circleY == 10){
      velY = -velY;
   }
   
   if(circleX >= height-10 || circleX <= 0){ 
      velX = -velX;
   }else if(circleX == 10){
      velX = -velX;
   }
}
