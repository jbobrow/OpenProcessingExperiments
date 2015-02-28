
int radius=40;
float x=-radius;
float speed=2.5;
float inf=0.52;
float sup=5.76;
float boca=0.2;

void setup(){
  size(240,120);
  ellipseMode(RADIUS);
}

void draw(){
  background(0);
  x+=speed;
  inf-=boca;
  sup+=boca;
  if( x > width + radius){
    x=-radius;
  }
  fill(255,255,0);
  arc(x,60,radius,radius,inf,sup);
  if((inf < 0-0.31)||(sup > TWO_PI+0.31)){
    boca=-boca;   
  }
  if((inf > 1.26)||(sup < 5.03)){
    boca=-boca;   
  }
}
