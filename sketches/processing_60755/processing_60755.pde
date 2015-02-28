
int x=0;
int y=0;
int i=0;
int speed=25;
float r=random(400);
float j=random(255);
float k=random(255);
float l=random(255);
void setup(){
  size(400, 400);
  background(0);
}
void draw(){
  background(0);
  frameRate(30);
  for (i=0; i<400; i=i+1);
  smooth();
noFill();
  strokeWeight(15);
  stroke(2*x, 0, x, x);
  ellipse(x, 200, y, x);
  x=x+speed;
  y=y+speed;
  if((speed>=800)||(x>=800)||(x<=0)||(speed<=0)){
  speed=speed*-1;
 x=x+10;
 y=y-10;
 x=0;
 y=0;
}
 stroke(x, 2*x, 3*x, x);
  strokeWeight(6);
  smooth();
  noFill();
  ellipse(x, x+2, 100, 100);
  x=x+speed;
  if(x>=width){
    x=0;
  }

}


