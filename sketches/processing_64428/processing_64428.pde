
float oldx;
float  oldy;
float a;

void reset(){
  oldx=width/2;
  oldy=height/2;
a=random(TWO_PI);
}
void setup(){
  size(500,500);
  background(255);

  smooth();
  noFill();
  reset();
  frameRate(180);
  
}

void draw(){
    float d=dist(width/2,height/2,oldx,oldy);
  float newx=oldx+cos(a)*5;
  float newy=oldy+sin(a)*5;
 
  stroke(d,0,0);
  
 
 
  strokeWeight(1+d/10);
 
line(oldx,oldy,newx,newy);
  oldx=newx;
  oldy=newy;
  
  a=a+random(-0.5,0.5);
  
  if(oldx<0||oldy<0||oldx>width||oldy>height){
    reset();}
  
  
  
}
  
  

