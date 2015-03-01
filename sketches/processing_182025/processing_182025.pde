
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
 noiseSeed=random(10);
  
}

void draw(){
  background(255);
  for (int mainY=0;mainY<height;mainY=mainY+5){
    y=mainY;
    for (int i=0;x<width;x++){
      yVariance=noise(noiseSeed)-.5;
      newY=y+yVariance;
      int transparency=int(map(x,1,width,1,50));
      stroke(0,transparency);
      line(x,y,x+1,newY);
      y=newY;
      noiseSeed+=0.09; //try different numbers
    }
   x=0;
  }
  
  
  
}
