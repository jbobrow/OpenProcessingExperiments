
int circleX = 100;
int vel = 5;
int circleY = 0;
int rad = 20;


void setup(){
   size(600,600);
   background(82,174,198);
   
   frameRate(50);
}


void draw (){
  background (82,174,198);
  
  fill(250, 229,162);
  noStroke();
  ellipse(circleX, circleY, rad, rad);
  
  circleY = circleY + vel;
  
  if(circleY == width){
    //circleX = 0;
    vel = -vel;
    //circleX=circleX-5;
   }else if(circleY == 0){
   vel = -vel;
   }
  
}

