
//Anthony Hernandez
//November 9,2011
//Trig Fuctions

float x,y,angle,rad;
int direction=1;

void setup(){
  //background(0);
  size(500,500);
  angle=0;
  rad=15;
  smooth();
}

void draw(){
  x=cos(radians(angle))*rad+width/2;
  y=sin(radians(angle))*rad+height/2;
  fill(x);
  ellipse(x,y,10,10);
  angle+=50; //you can change this to angle+=.5 to slow down
  rad+=direction;
  
  if(rad>250){
    direction=-1;}
    if(rad<0){
      direction=1;}
}

  //fill(x);
  //ellipse(width/2,height/2,350,350);


