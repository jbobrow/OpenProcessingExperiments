
float tempo=0.0;
float px,py,y;

void setup(){
  size(851,315);
  background(0);
  smooth();

  noFill();
  //  frameRate(1);
}

void draw(){
  // background(0);
  stroke(60,random(255),random(255),10);
  float x=0;
  px=0;
  py=0;
  
  while(x<width){
    y=20+500*noise(x/100,tempo);
    
    line(px,py,x,y);
    px=x;
    py=y;

    x+=5;
  }

  tempo+=0.002;  
}
