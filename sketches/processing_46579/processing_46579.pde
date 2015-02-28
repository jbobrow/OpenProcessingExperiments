
//type filter
PImage jk;
int x,y,pX,pY;


void setup(){
  colorMode(HSB,360,100,100);
  size(700,700);
  smooth();
  background(0,0,100);
}
void draw(){
  jk = loadImage("jk.gif");
  strokeWeight(.25);
  pX=0;
  pY=0;
  for(int i=0;i<100;i++){
    x=int(random(width));
    y=int(random(height));
    
    color cp = jk.get(x,y);
    color cpPrev=jk.get(pX,pY);
    
    float b = brightness(cp);
    float bPrev=brightness(cpPrev);
   
    if(b==0){
      float ellsize=random(5,15);
      ellipse(x,y,ellsize,ellsize);
    if(b==0 && bPrev==0 && dist(x,y,pX,pY)<1200){
      line(x,y,pX,pY);
    }
    pX=x;
    pY=y;
  }
  } 
}


