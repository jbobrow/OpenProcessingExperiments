
//Elizabeth Ibarra
//Homework 2
//www.learningprocessing.com & processing.org


int x ;
int y ;
int speedx;
int speedy;
int x2 ;
int y2 ;
int speedx2 ;
int speedy2 ;
int x3;
int y3;
int speedx3;
int speedy3;
int x4;
int y4;
int speedx4;
int speedy4;
int x5;
int y5;
int speedx5;
int speedy5;


void setup() {
  size(600,600);
  smooth();
  background(0);
  x = 300;
  y = 250;
  speedx=5;
  speedy=5;
  
  //ball2
  x2 = 300;
  y2 = 250;
  speedx2=3;
  speedy2=3;
  
  //ball3
  x3 = 300;
  y3 = 250;
  speedx3 = 1;
  speedy3 = 1;
  
  //ball4
  x4 = 300;
  y4 = 250;
  speedx4 = 7;
  speedy4 = 7;
  
  //ball5
  x5 = 300;
  y5 = 250;
  speedx5 = 9;
  speedy5 = 9;
}

void draw(){



//first cube

x+=speedx;
y+=speedy;

//ball1
if (y>579){
  speedy=-5;
}

if (y<15){
  speedy=5;
}

if(x>120){
  speedx=-5;
}
if(x<17){
  speedx=5;
}

noStroke();
fill(x,y+4,100,20);
ellipse(x,y,20,20);



//2
x2+=speedx2;
y2+=speedy2;

//ball2
if (y2>306){
  speedy2=-5;
}

if (y2<15){
  speedy2=5;
}

if(x2>249){
  speedx2=-5;
}
if(x2<156){
  speedx2=5;
}

noStroke();
fill(x2,100,y2,20);
ellipse(x2,y2,20,20);

//ball3

x3+=speedx3;
y3+=speedy3;


if (y3>423){
  speedy3=-5;
}

if (y3<323){
  speedy3=5;
}

if(x3>580){
  speedx3=-5;
}
if(x3<156){
  speedx3=5;
}

noStroke();
fill(120,x3,y3,20);
ellipse(x3,y3,20,20);

//ball4

x4+=speedx4;
y4+=speedy4;


if (y4>306){
  speedy4=-6;
}

if (y4<15){
  speedy4=6;
}

if(x4>580){
  speedx4=-6;
}
if(x4<280){
  speedx4=6;
}

noStroke();
fill(120,13,y4,20);
ellipse(x4,y4,20,20);


//ball5

x5+=speedx5;
y5+=speedy5;


if (y5>579){
  speedy5=-9;
}

if (y5<439){
  speedy5=9;
}

if(x5>580){
  speedx5=-9;
}
if(x5<139){
  speedx5=9;
}

noStroke();
fill(x5,200,45,20);
ellipse(x5,y5,20,20);


}

