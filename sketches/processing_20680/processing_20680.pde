
PImage fartbarf;
float x,y,prevX,prevY;

void setup(){
  colorMode(HSB,360,100,100);
  size(600,600);
  smooth();
  background(317,30,100);
  strokeWeight(.5);
  fartbarf = loadImage("fartbarf.png");
  frameRate(200);
  prevX=0;
  prevY=0;

  for(int i=0; i <1000000; i++){
    x = random(width);
    y = random(height);
    
    color cp = fartbarf.get(int(x),int(y));
    color cpPrev= fartbarf.get(int(prevX),int(prevY));
    
    float b = brightness(cp);
    float bPrev = brightness(cpPrev);
    

    if(b==0){
      float ellSize = random(1,5);
      fill(360,0,100);
      //ellipse(x,y,ellSize,ellSize);
   if(b ==0 && bPrev == 0 && dist(x,y,prevX,prevY) <35){
   line(x,y,prevX,prevY);
   }
   
   prevX=x;
   prevY=y;
     
    }
  }
}


