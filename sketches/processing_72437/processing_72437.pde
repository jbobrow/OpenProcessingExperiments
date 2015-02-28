

float rectY1=0;
float rectY2=0;
float rectY3=0;
float rectY4=0;
float rectY5=0;
float rectY6=0;
float rectY7=0;

float a;


void setup(){
  size(250,500);
  smooth();
  background(0);
}

void draw(){
 // frameRate(40);
   a=random(255);

  fill(frameCount%255,0,255,a);
  rectMode(CENTER);
  rect(10,rectY1%height,10,80);
  rect(100,rectY2%height,50,70);
  rect(40,rectY3%height,10,60);
  rect(180,rectY4%height,10,10);
  rect(210,rectY5%height,5,40);
  rect(250,rectY6%height,35,10);
  
  rectY1=random(0,5)+rectY1;
  rectY2=random(0,20)+rectY2;
  rectY3=random(0,50)+rectY3;
  rectY4=random(0,30)+rectY4;
  rectY5=random(0,8)+rectY5;
  rectY6=random(0,40)+rectY6;
  
  fill(0);
  rect(0,rectY7%height,500,10);
  rectY7=rectY7+10;
  
 }



