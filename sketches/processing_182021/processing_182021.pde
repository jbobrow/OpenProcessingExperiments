
float y;
float x;
float yVariance;
float newY;
float noiseSeed;

void setup(){
 size(500,500);
 smooth();
 y=height/2;
 x=0;
 strokeWeight(1);
 stroke(0,200);
 frameRate(10);
 
  
}

void draw(){
  background(255);
  noiseSeed=random(10);// try 2
  for (int i=0;x<width;x++){
    yVariance=noise(noiseSeed)-.150;
    newY=y+yVariance;
    line(x,y,x+1,newY);
    y=newY;
    noiseSeed+=0.08;
  }
  x=0;
  y=height/2;
  
  
  
}
