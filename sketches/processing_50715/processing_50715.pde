
int ellipsePath;
int direction;
int ydirection;
int yellipsePath;

//lets set colors to change for time of day!
//lets introduce 

void setup(){
  size(927,600);
  smooth();

  background(0);
  fill(80,100);
  rect(0,0,927,600);
  //fill(direction-700,ydirection-400,ellipsePath-700);
  ellipsePath=250;
  direction = 5;
  ydirection =2;
  yellipsePath=0;
  //println( x + + y );
  //more crosses? y value diff from x
  //more layers viewable? increase size, or decrease size of ellipse
  //try running with no fill
   
}

void draw(){
  ellipsePath+=direction; //ellipsePath = ellipsePath + direction
  yellipsePath+=ydirection;
  if(ellipsePath > 900){
    direction= -5;
  }
  if(ellipsePath<0){
    direction=+5;
  }
  if(yellipsePath<0){
    ydirection=+2;
  }
  if(yellipsePath>600){
    ydirection=-2;
  }
  
  fill(hour()*13);
  rect(ellipsePath, yellipsePath, 10, 10);
  fill(minute()*6.5);
  rect(ellipsePath+20, yellipsePath, 10, 10);
  fill(second()*6.5);
  rect(ellipsePath+40, yellipsePath, 10, 10);
  
  
}


