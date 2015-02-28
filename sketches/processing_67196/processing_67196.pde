
float circX;
float circY;
float circleX;
float circleY;
float XVel;
float YVel;
float XVelo;
float YVelo;
float gravity;

void setup(){
  size(500,500);
  smooth();
  circX=width/2;
  circY=height/2;
  circleX=width/2;
  circleY=height/2;
  
  XVel=4;
  YVel=4;;
  XVelo=3;
  YVelo=3;
  gravity=.3;
}

void draw(){
  background(0);
  fill(255,0,255);
  noStroke();
  YVelo=YVelo;
  YVel=YVel;
  circX=circX+XVel;
  circY=circY+YVel;
  circleX=circleX+XVelo;
  circleY=circleY+YVelo;
  if((circX>width)||(circX<0)){
    XVel=XVel*(-1);
  }
  if((circY>height)||(circY<0)){
    YVel=YVel*(-1);
    XVel=XVel*(1);
  }
  if(circY>height){
    circY=height;
  }
  circleX=circleX+XVel;
  circleY=circleY+YVel;
  if((circleX>width)||(circleX<0)){
    XVelo=XVelo*(-1);
  }
  if((circleY>height)||(circleY<0)){
    YVelo=YVelo*(-1);
    XVelo=XVelo*(1);
  }
  if(circleY>height){
    circleY=height;
  }
  if((circleX==circX)&&(circleY==circY)){
    YVel=YVel*(-1);
    XVel=XVel*(-1);
    YVelo=YVelo*(-1);
    XVelo=XVelo*(-1);
  }
  ellipseMode(RADIUS);
  ellipse(circX,circY,30,30);
  fill(255,0,0);

  ellipse(circleX,circleY,30,30);
  fill(0,0,255);
}


