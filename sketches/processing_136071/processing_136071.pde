
int x=50;
int speedx=8;
int y=0;
int speedy=6;
int z=100;
int speedz=4;

void setup(){
  size(400,400);
  smooth ();
}

void draw(){
  background(255);
  frameRate(15);
  noStroke();
  fill(227,99,80,150);
  ellipse(x,200,100,100);
  fill(164,70,159,150);
  ellipse(y,100,150,150);
  fill(78,179,211,150);
  ellipse(z,300,150,150);

  
  x=x+speedx;
  if ((x<0)||(x>400)){
    speedx=speedx*-1;
  }
  y=y+speedy;
  if ((y<0)||(y>400)){
    speedy=speedy*-1;
  }
  z=z+speedz;
  if ((z<0)||(z>400)){
    speedz=speedz*-1;
  }
  }



