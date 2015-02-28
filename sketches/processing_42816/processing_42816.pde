
//dan 17:12 16/10/2011

int speedX=5;
int x=10;
int speedA=5;
int speedB=0;
int a=0;
int b=0;
color strokeColor=color(random(255),random(255),random(255));
color fillColor=color(255);

void setup() {
size(400,400);
smooth();
}

void draw() {
  stroke(strokeColor);
  x+=speedX;
  a+=speedA;
  b+=speedB;
  if(a>=width&&b<height) {speedA=0; speedB=5;}
  if(b>=height&&a==width){speedA=5; speedB=0;}
  if(a>=width&&b>=height) {speedA=-5; speedB=0;}
  if(a<=0&&b>=height) {speedA=0; speedB=-5;}
  if(a<=0&&b<=0) {a=1;b=0;speedB=0;speedA=5;strokeColor=color(random(255),random(255),random(255));}

  if(x>=width||x<=5){speedX*=-1; }
  line(width*.5,height*.5,a,b);

  if(mousePressed) {stroke(0);noFill();}
  else { noStroke(); fill(fillColor);}
  ellipse(width*.5,height*.5,x,x);
}                               
