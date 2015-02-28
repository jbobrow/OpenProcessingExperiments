
int ellipsePath;
int direction;
int ydirection;
int yellipsePath;

//lets set colors to change for time of day!
//lets introduce 

void setup(){
  size(900,600);
  smooth();
  background(0);
  //noStroke();
  fill(80,100);
  rect(0,0,900,600);
  //fill(direction-700,ydirection-400,ellipsePath-700);
  ellipsePath=250;
  direction = 2;
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
  
  fill(hour()*13);
  ellipse(ellipsePath, yellipsePath, 20, 20);
  fill(minute()*6.5);
  ellipse(ellipsePath+15, yellipsePath, 20, 20);
  fill(second()*6.5);
  ellipse(ellipsePath+30, yellipsePath, 20, 20);
  
  
}



