
//variables

//float, for numbers with a decimal point
float x;
float x1;
float x2;
float x3;
float x4;
float x5;

//int, whole numbers, with no decimal point
int y1;
int y2;
int y3;
int y4;
int y5;

//variable to be used for wall position 
float a;

//set speed for each ball 
int speed1 = 8;
int speed2 = 5;
int speed3 = 10;
int speed4 = 18;
int speed5 = 25;

//set up
void setup(){
  size(150,600);
  background(50);
  frameRate(50);
 
//random initial position
  x=random(50,100);
 // x2=random(100,600);
 // x3=random(100,600);
 // x4=random(100,650);
 // x5=random(100,650);
 
//random for wall position in y
  a=random(400,550);
}
 
//draw background and smooth 
void draw(){
  smooth();
  background(50);
 
//draw balls 
  noStroke();
  fill(0);
  
//set initial position and size
  ellipse(x,y1,10,10);
//position in x remains the same  
  x=x;
//y position affected by speed
  y1=y1+speed1;
  
  ellipse(x,y2,20,20);
  x=x;
  y2=y2+speed2;
  ellipse(x,y3,30,30);
  x=x;
  y3=y3+speed3;
  ellipse(x,y4,20,20);
  x=x;
  y4=y4+speed4;
  ellipse(x,y5,30,30);
  x=x;
  y5=y5+speed5;
 
//when the ball hits the wall
  
  if(y1<a-10){
  }
  else{
    speed1=speed1*-1;
  }
  if(y2<a-15){
  }
  else{
    speed2=speed2*-1;
  }
  if(y3<a-20){
  }
  else{
    speed3=speed3*-1;
  }
  if(y4<a-15){
  }
  else{
    speed4=speed4*-1;
  }
  if(y5<a-20){
  }
  else{
    speed5=speed5*-1;
  }
 
//when the ball hits the top
  if(y1>0-5){
  }
  else{
    speed1=speed1*-1;
  }
  if(y2>0-10){
  }
  else{
    speed2=speed2*-1;
  }
  if(y3>0-15){
  }
  else{
    speed3=speed3*-1;
  }
  if(y4>0-10){
  }
  else{
    speed4=speed4*-1;
  }
  if(y5>0-20){
  }
  else{
    speed5=speed5*-1;
  }
 
 
//the WALL
stroke(255);
strokeWeight(20);
line(width-width,a,width,a);
 
}

