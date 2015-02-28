
// Homework #7 for Jim Roberts' CFA-757
// Carnegie Mellon University, Pittsburgh
// Zoe Lu copyright Spring 2012, PA 15213

/**
/* initials bouncing around the window
/* the speed of the wrapping object is controled by mouse movement
/* mouse move right or down will increase the speed
/* mouse move left or up will slow down the object
/* time and collision are shown on the left-top corner
*/

int time,numC;
float ix,iy,tx,ty,iDia;
float ixSpeed,iySpeed,txSpeed,tySpeed;
float r,g,b;
float stk;

void setup(){

  size(400,400);
  textSize(16);
  textAlign(LEFT);
  smooth();
  stk=5;
  r=255;
  g=216;
  b=216;
  ix=10;
  iy=random(height);
  tx=width/2;
  ty=height/2;
  iDia=30;
  ixSpeed=2;
  iySpeed=2;
  txSpeed=1;
  tySpeed=1;
  numC=0;
}

void draw(){
  countTime();
  countCollision();
  prepWindow();
  initials(ix,iy,iDia);
  bounceInitials();
  drawTarget(tx,ty);
  wrapTarget();
}

//wrap the target
void wrapTarget(){
  tx+=txSpeed;
  ty+=tySpeed;
  if(tx>width){
    tx=random(10);
  }
  if(ty>height){
    ty=random(15);
  }
  if(tx<0){
    txSpeed*=-1;
  }
  if(ty<0){
    tySpeed*=-1;
  }
}

//mouseMoved
void mouseMoved(){
  if(mouseX>pmouseX){
    txSpeed+=.1;
  }
  if(mouseX<pmouseX){
    txSpeed-=.1;
  }
  if(mouseY>pmouseY){
    tySpeed+=.1;
  }
  if(mouseY<pmouseY){
    tySpeed-=.1;
  }
}

//bounce the initials
void bounceInitials(){
  ix+=ixSpeed;
  iy+=iySpeed;
  if(ix>width){
    ixSpeed=-ixSpeed;
  }
  if(ix<0){
    ixSpeed=-ixSpeed;
  }
  if(iy>height){
    iySpeed=-iySpeed;
  }
  if(iy<0){
    iySpeed=-iySpeed;
  }
}

void countTime(){
  time=millis()/1000;
  fill(255);
  text("Time: "+round(time)+" sec",20,50);  
}

void countCollision(){
  text("Num of Collision: " +numC, 20,25);
  float dis=dist(ix,iy,tx,ty);
  if(dis<65){
    txSpeed*=-1;
    tySpeed*=-1;
    numC++;
    ixSpeed+=.5;
    iySpeed+=.5;
  }
}

void prepWindow(){
  fill(10,80);
  rect(-10,-10,width+20,height+20);
}
void initials(float x, float y, float diam){
    strokeWeight(stk);
    stroke(r,g,b);
    //draw a circle
    ellipse(x,y,diam*2,diam*2);
    //draw a Z
    stroke(r-21,g-58,b+22);
    beginShape();
      curveVertex(x,y);
      curveVertex(x-0.87*diam, y-0.5*diam);
      curveVertex(x, y-0.875*diam);
      curveVertex(x-0.7*diam, y+0.7*diam); 
      curveVertex(x, y+0.125*diam);
      curveVertex(x,y);
    endShape();
    //draw a L
    beginShape();
      curveVertex(x,y);
      curveVertex(x, y-0.5*diam);
      curveVertex(x, y+0.875*diam);
      curveVertex(x+0.86*diam, y+0.5*diam); 
      curveVertex(x,y);
    endShape();
}

void drawTarget(float x,float y){
  fill(255,255,255);
  ellipse(x,y,35,35);
  fill(93,186,255);
  ellipse(x,y,30,30);
  fill(255,247,88);
  ellipse(x,y,25,25);
  
}                                                               
