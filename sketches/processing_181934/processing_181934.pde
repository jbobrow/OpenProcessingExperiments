
float y;
float x;
float yVariance;
float newY;

void setup(){
 size(500,500);
 smooth();
 y=height/2;
 x=0;
 strokeWeight(4);
 stroke(0,200);
 background(255);
  frameRate(10);
}

void draw(){
  
  background(255);
  for (int i=0;x<width;x++){
    yVariance=random(-1,1);
    newY=y+yVariance;
    line(x,y,x+1,newY);
    y=newY;
  }
  x=0;
  y=height/2;
 
  
}
