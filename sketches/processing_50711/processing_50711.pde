
int ellipsePath;
int direction;
int ydirection;
int yellipsePath;



void setup(){
  size(900,600);
  //noStroke();
  smooth();
  background(0);
  fill(80,100);
  rect(0,0,900,600);
  //fill(direction-700,ydirection-400,ellipsePath-700);
  ellipsePath=250;
  direction = 2;
  ydirection =2;
  yellipsePath=0;
  //println( x + + y );
 
   
}

void draw(){
  ellipsePath+=direction; //ellipsePath = ellipsePath + direction
  yellipsePath+=ydirection;
  if(ellipsePath > 900){
    direction= -2;
  }
  if(ellipsePath<0){
    direction=+2;
  }
  if(yellipsePath<0){
    ydirection=+2;
  }
  if(yellipsePath>600){
    ydirection=-2;
  }
  fill(hour()*6.5,minute()*6.5,second()*6.5);
  ellipse(ellipsePath, yellipsePath, 20, 20);
  
}



