
int x,y;

void setup(){
size(500,500);
noStroke();  
smooth();
background(255);
 x=0;
 y=100;
frameRate(100);
}

int speedX = 7;
int speedY = 2;

void draw(){  

  x=x+ speedX;
  y=y+ speedY;
  if(x>width){
    speedX = speedX * -1;}
  else if (x<0){
    speedX=speedX*-1;}
  if (y>height){
    speedY = speedY * -1;}
    else if(y<0){
      speedY= speedY * -1;}
 ellipse(x,y,9,9);
  fill(random(255),random(255),random(255));
noStroke();
}



