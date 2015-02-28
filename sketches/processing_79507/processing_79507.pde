
//Kyle K. Cilia
//pa6
//cmps5j
//kcilia@ucsc.edu

//Variable declaration
float xspeed,yspeed;
float x,y,r;
float gravity;
float speed=0;
float dissipation,stopSpeed;

void setup(){
  noStroke();
  size(500,500);
  smooth();
  x=width/2;
  y=50;
  r=50;
  
  //Initialize physical environment
  gravity=0.6;   
  stopSpeed=0.2;
  dissipation=.08;
}

void draw(){
  background(0,255,255); 
  displayBall();
  if(mousePressed && mouseOnBall()){
    holdBall();
  }else{
    moveBall();
    updateSpeed();
  }
}

void displayBall(){
  y=constrain(y,r,height-r);
  x=constrain(x,r,width-r);
  ellipseMode(RADIUS);
  fill(255,0,0);
  ellipse(x,y,r,r);
}

boolean mouseOnBall(){
  if(mouseX>x-r && mouseX<x+r &&
     mouseY>y-r && mouseY<y+r){
       return true;
     }else{
       return false;
     }
}

void holdBall(){
    x=mouseX;
    y=mouseY;
    xspeed=mouseX-pmouseX;
    yspeed=mouseY-pmouseY;
}

void moveBall(){
  y=y+yspeed;
  x=x+xspeed;
}

void updateSpeed(){
  if(abs(yspeed)<stopSpeed){
    yspeed=0.0;
  }else if(y>height-r){
    yspeed*=-(1-dissipation);
  }else if(y<r){
    yspeed*=-(1-dissipation);
  }
  if( abs(xspeed)<stopSpeed ){
    xspeed=0.0;
  }else if(x>width-r){
    xspeed*=-(1-dissipation);
  }else if(x<r){
    xspeed*=-(1-dissipation);
  }
  yspeed+=gravity;
}
  



 

