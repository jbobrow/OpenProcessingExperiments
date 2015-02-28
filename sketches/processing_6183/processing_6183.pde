
float xa=1;
float ya=1;
float xb=0;
float yb=0;
int xav=1;
int yav=2;
int xbv=-2;
int ybv=-1;
int step=6;
int colour=(int)random(10000);
void setup() {  
  frameRate(12);
  size(720,480);
  xb=width-10;
  yb=height-10;
  background(0);
  fill(0,10);
}
void draw() {
  noStroke();
  rect(0,0,width,height);
  strokeWeight(1);
  colour++;
  stroke((colour+0)%255, (.3*colour)%255,(.7*colour)%255);
  if (xa > width-10 || xa<1) xav*=-1;
  if (xb > width-10 || xb<1) xbv*=-1;
  if (ya > height-10 || ya<1) yav*=-1;
  if (yb > height-10 || yb<1) ybv*=-1;
  xa+=(xav*step);
  xb+=(xbv*step);
  ya+=(yav*step);
  yb+=(ybv*step);
  line(xa,ya,xb,yb);
}

