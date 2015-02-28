
// Jeffrey C. CP1 Ticklish Penguin Assignment
// URL: http://www.openprocessing.org/user/21148

float x0=-75;
float y0=-75;
PImage quake;

void setup(){
  size(400,400);
  quake=loadImage("sfearthquake.jpg");
}

void draw(){
  background(255);
  noStroke();
  image(quake,x0,y0,650,650);
  x0=x0+3*(float)random(-2,2);
  y0=y0+3*(float)random(-2,2);
  if(x0>50){
    x0=-75;
  }
  else if(x0<0 && x0>-25){
    x0=-75;
  }
  if(y0>50){
    y0=-75;
  }
  else if(y0<0 && y0>-25){
    y0=-75;
  }
}


