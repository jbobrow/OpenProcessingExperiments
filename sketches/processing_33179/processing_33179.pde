
int circleX = 0;
int vel = 10;
int circleY = 473;
int rad = 50;

 
void setup(){
  size(700,500);
  background(255,0,127);
   
  frameRate(60);
}

void draw()

{
  background(#1a8b07);
   
  fill(255);
  noStroke();
  ellipse(circleX,circleY,rad,rad);
   
  circleX = circleX + vel;
   
  if(circleX==width){
    vel = -vel;
    rad = 50;
  }
  else if(circleX==0){
    vel = -vel;
  }
}



