
int x,y;
int xspeed,yspeed;

void setup(){
  size(400,400);
  smooth();
  ellipseMode(CENTER);
  x=60;
  y=10;
  xspeed=5;
  yspeed=6;
}

void draw() {
  
  x=x+xspeed;
  y=y+yspeed;
  if(y>=400 || y<=0) {
  yspeed=yspeed*-1;
  }
  if (x>400 || x<=0) {
    xspeed=xspeed*-1;
  }
  background(280,80,10);
  
  stroke(100);
  fill(0,255,0);
  ellipse(x,y,20,20);
}

