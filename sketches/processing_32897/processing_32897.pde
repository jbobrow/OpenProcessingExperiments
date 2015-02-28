
int circleX = 0;
//<div id="circleX">
int vel = 5;
int circleY = 100;
int rad = 20;

void setup(){
  size(400,400);
  background(255,0,127);
  
  frameRate(25);
}

void draw(){
  background(255,0,127);
  
  fill(255);
  noStroke();
  ellipse(circleX,circleY,rad,rad);
  
  circleX = circleX + vel;
  
  if(circleX==width){
    //circleX = 0;
    vel = -vel;
    rad = 50;
    //circleX=circleX-5;
  }else if(circleX==0){
    vel = -vel;
  }
}

                
                
