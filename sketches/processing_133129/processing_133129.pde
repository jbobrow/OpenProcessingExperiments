
void setup(){
  size(400,400);
}
int x=100;
int speedx=11;
int y=0;
int speedy=7;
int z=50;
int speedz=4;
void draw(){
  background(0);
  frameRate(30);
  noStroke();
  fill(80,180,220,220);
  ellipse(x,200,150,150);
  fill(80,220,180,220);
  ellipse(y,100,150,150);
  fill(80,220,220,220);
  ellipse(z,300,150,150);
  x=x+speedx;
  if ((x<0)||(x>=350)){
    speedx=speedx*-1;
  }
  y=y+speedy;
  if ((y<0)||(y>=350)){
    speedy=speedy*-1;
  }
  z=z+speedz;
  if ((z<0)||(z>=350)){
    speedz=speedz*-1;
  }
}
