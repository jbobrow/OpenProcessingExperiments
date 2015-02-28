
int x = 0;
int speed = 1;
int y = 0;
int alt = 5;
int a = 0;
int b = 0;
int blocka = 6;
int blockb = 7;
void setup(){
  background(0);
  size(400,400);
  noStroke();
  smooth();
   
}
void draw(){
frameRate(30);
background(0);
ball();
playerOne();
playerTwo();
for (int j = 0; j <= 400; j +=15)
  {
    barrier(j);
  }
zero(160);
zero(220);
}

void playerOne (){
  noStroke();
  fill(255);
  rect(0,a,15,50);
  a=a+blocka;
  if((a<0)||(a>=350))
{
  blocka=blocka*-1;
}
}

void playerTwo (){
  noStroke();
  fill(255);
  rect(385,b,15,50);
  b=b+blockb;
  if((b<0)||(b>=350))
{
  blockb=blockb*-1;
}
}

void ball() {
  noStroke();
  fill(255);
  rect(x+15,y,10,10);
   x=x+speed;
y=y+alt;
if((x<0)||(x>=375)){
speed=speed*-1;
}
if((y<0)||(y>=400))
{
  alt=alt*-1;
}
}

void zero(int i) {
  strokeWeight(10);
  stroke(255);
  noFill();
  rect(i,10,20,40);
}

void barrier(int k){
  noStroke();
  fill(255,255,255,150);
  rect(195,k,10,10);
}
