
float a=0;
float b=0;
float co=0;

void setup(){
  
  background(255);
  colorMode(HSB,100);
  size(500,500);
  smooth();
  strokeWeight(5);
  frameRate(180);
}
  void draw(){
    stroke(co,100,100,20);
  float x0=map(sin(a), -1,1,20,480);
  
  float y0=map(cos(a),-1,1,20,480);
  
  float x1=map(sin(a), -1,1,20,480);
  float y1=map(cos(a), -1,1,20,480);
  
  line(x0,y0,x1,y1);
  
  
  a=a+0.4;
  b=b+0.4;
  
  
  co=co+1;
  if(co>100){
    co=0;
}
  }

