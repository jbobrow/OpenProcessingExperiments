
float x1;
float x2;
float x3;
float x4;
float x5;
int y1;
int y2;
int y3;
int y4;
int y5;

float a;
float b;

int speed1=1;
int speed2=5;
int speed3=10;
int speed4=18;
int speed5=25;

void setup(){
  size(500,500);
  background(140,210,30);
  frameRate(50);

  x1=random(50,200);//ramdon for ball
  x2=random(200,450);
  x3=random(20,240);
  x4=random(180,400);
  x5=random(150,350);

  a=random(250,450);//ramdon for line
  b=random(50,150);//ramdon for line
}




void draw(){
  smooth();
  background(140,210,30);

  stroke(0);
  strokeWeight(3);
  ellipse(x1,y1,10,10);//for three balls
  x1=x1;
  y1=y1+speed1;
  ellipse(x2,y2,20,20);
  x2=x2;
  y2=y2+speed2;
  ellipse(x3,y3,30,30);
  x3=x3;
  y3=y3+speed3;
  ellipse(x4,y4,40,40);
  x4=x4;
  y4=y4+speed4;
  ellipse(x5,y5,50,50);
  x5=x5;
  y5=y5+speed5;

  //反彈條件
  if(y1<a-5){
  }
  else{
    speed1=speed1*-1;
  }
  if(y2<a-10){
  }
  else{
    speed2=speed2*-1;
  }
  if(y3<a-15){
  }
  else{
    speed3=speed3*-1;
  }
  if(y4<a-20){
  }
  else{
    speed4=speed4*-1;
  }
  if(y5<a-25){
  }
  else{
    speed5=speed5*-1;
  }

  /*if(y2>y4/10){
   strokeWeight(3);
   line(width-width,y5,width,y5);
   }*/

  //re bound condition
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
  if(y4>0-20){
  }
  else{
    speed4=speed4*-1;
  }
  if(y5>0-25){
  }
  else{
    speed5=speed5*-1;
  }


  //the yellow line
  stroke(255,200,100);
  strokeWeight(5);
  line(width-width,a,width,a);

}





