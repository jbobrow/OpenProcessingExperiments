
int posX = 200;
int posY = 300;
int speedx = 3;
int speedy = 3;
int circleWidth = 250;
 
void setup(){
  size(600,600);
  ellipseMode(CENTER);
}
 
void draw(){
  background(216,239,235);
  fill(255,0,0);
  noStroke ();
  ellipse(posX, posY, circleWidth, circleWidth);
  
  if (posX < 0 + (circleWidth/2)){
    speedx = -1*speedx;
  }
   
   if (posX > width - (circleWidth/2)){
    speedx = -1*speedx;
  }
   
  if (posY < 0 + (circleWidth/2)){
    speedy = -1*speedy;
  }
   
  if (posY > height- (circleWidth/2)){
    speedy = -1*speedy;
  }
   
  posX = posX + speedx;
  posY = posY + speedy;
   
}
