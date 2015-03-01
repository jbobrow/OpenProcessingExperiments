
int x=200;
int y=-50;
int z=-50;
int a=-50;
int xspeed=1;
int yspeed=3;//medium
int zspeed=4;//fast
int aspeed=2;//slow
void setup(){
  size(105,400);
  smooth();
  noStroke();
}
void background(){ // background
  frameRate(40);
  background(187,227,x);
  x=x+xspeed;
  if((x>=255)||(x<=200)){
    xspeed=xspeed*-1;
  }
}
void rain(int x, int y){
  fill(111,227,x,150);
  ellipse(0,y,10,20);
  ellipse(0,y-150,10,20);
  ellipse(15,a-10,10,20);
  ellipse(15,a-150,10,20);
  ellipse(30,z-5,20,50);
  ellipse(30,z-200,20,50);
  ellipse(35,y-5,10,20);
  ellipse(35,y-150,10,20);
  ellipse(45,a,15,30);
  ellipse(45,a-300,15,30);
  ellipse(55,z-80,10,30);
  ellipse(55,z-250,10,30);
  ellipse(65,y-20,10,20);
  ellipse(65,y-200,10,20);
  ellipse(70,a-30,10,20);
  ellipse(70,a-250,20,40);
  ellipse(80,z-30,10,30);
  ellipse(80,z-150,10,30);
  ellipse(85,a-50,10,20);
  ellipse(85,a-150,10,20);
  ellipse(95,y-60,10,20);
  ellipse(95,y-160,10,20);
  ellipse(105,z-90,20,40);
  ellipse(105,z-220,10,20);
  y=y+yspeed;
  x=x+xspeed;
  z=z+zspeed;
  a=a+aspeed;
  if((x>=255)||(x<=200)){
    xspeed=xspeed*-1;
  }
  if (y>=750){
    y=-50;
  }
  if(z>=750){
    z=-50;
  }
  if(a>=750){
    a=-50;
  }
}
void draw(){
  background();
  rain(x,y);
  
}
