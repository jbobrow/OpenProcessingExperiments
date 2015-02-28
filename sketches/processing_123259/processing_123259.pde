
//Digital Wallpaper 2
//Carmen Zhou
//11-1-12

//width
float a=0;
float a1=0;
float a2=0;
float a3=0;
float a4=0;
float a5=0;
float a6=0;
float a7=0;
float a8=0;
float a9=0;
float a10=0;
float a11=0;
float a12=0;

//height
float b;
float b1=0;
float b2=0;
float b3=0;
float b4=0;
float b5=0;
float b6=0;
float b7=0;
float b8=0;
float b9=0;
float b10=0;
float b11=0;
float b12=0;

//widthspeed
float aspeed=5.5;
float a1speed=5.25;
float a2speed=5;
float a3speed=4.75;
float a4speed=4.5;
float a5speed=4.25;
float a6speed=4;
float a7speed=3.75;
float a8speed=3.5;
float a9speed=3.25;
float a10speed=3;
float a11speed=2.75;
float a12speed=2.5;



//heighspeed
float bspeed=5.5;
float b1speed=5.25;
float b2speed=5;
float b3speed=4.75;
float b4speed=4.5;
float b5speed=4.25;
float b6speed=4;
float b7speed=3.75;
float b8speed=3.5;
float b9speed=3.25;
float b10speed=3;
float b11speed=2.75;
float b12speed=2.5;

//height of rectangle
int c=100;
//length of rectangle
int d=10;

void setup(){
  frameRate(30);
  background(0);
  size(500,500);
  smooth();
  b=width;
  b1=width;
  b2=width;
  b3=width;
  b4=width;
  b5=width;
  b6=width;
  b7=width;
  b8=width;
  b9=width;
  b10=width;
  b11=width;
  b12=width;
}


void draw(){
  fill(255,255,255,5);
  strokeWeight(1);
  rectMode(CENTER);
  rect(a,500,c,d);
  rect(b,480,c,d);
  rect(a1,460,c,d);
  rect(b1,440,c,d);
  rect(a2,420,c,d);
  rect(b2,400,c,d);
  rect(a3,380,c,d);
  rect(b3,360,c,d);
  rect(a4,340,c,d);
  rect(b4,320,c,d);
  rect(a5,300,c,d);
  rect(b5,280,c,d);
  rect(a6,260,c,d);
  rect(b6,240,c,d);  
  rect(a7,220,c,d);
  rect(b7,200,c,d);
  rect(a8,180,c,d);
  rect(b8,160,c,d);  
  rect(a9,140,c,d);
  rect(b9,120,c,d);
  rect(a10,100,c,d);
  rect(b10,80,c,d);
  rect(a11,60,c,d);
  rect(b11,40,c,d);
  rect(a12,20,c,d);
  rect(b12,0,c,d);
    

a=a+aspeed;
b=b+bspeed;
a1=a1+a1speed;
b1=b1+b1speed;
a2=a2+a2speed;
b2=b2+b2speed;
a3=a3+a3speed;
b3=b3+b3speed;
a4=a4+a4speed;
b4=b4+b4speed;
a5=a5+a5speed;
b5=b5+b5speed;
a6=a6+a6speed;
b6=b6+b6speed;
a7=a7+a7speed;
b7=b7+b7speed;
a8=a8+a8speed;
b8=b8+b8speed;
a9=a9+a9speed;
b9=b9+b9speed;
a10=a10+a10speed;
b10=b10+b10speed;
a11=a11+a11speed;
b11=b11+b11speed;
a12=a12+a12speed;
b12=b12+b12speed;



  if (a > width/2  || a < 0) {
    aspeed = aspeed * -1;
  }
  if (b > width || b < width/2) {
    bspeed = bspeed * -1;
  }
  if (a1 > width/2  || a1 < 0) {
    a1speed = a1speed * -1;
  }
    if (b1 > width || b1 < width/2) {
    b1speed = b1speed * -1;
  }
   if (a2 > width/2  || a2 < 0) {
    a2speed = a2speed * -1;
  }
   if (b2 > width || b2 < width/2) {
    b2speed = b2speed * -1;
  }
   if (a3 > width/2  || a3 < 0) {
    a3speed = a3speed * -1;
  }
   if (b3 > width || b3 < width/2) {
    b3speed = b3speed * -1;
  }
   if (a4 > width/2  || a4 < 0) {
    a4speed = a4speed * -1;
  }
   if (b4 > width || b4 < width/2) {
    b4speed = b4speed * -1;
  }
   if (a5 > width/2  || a5 < 0) {
    a5speed = a5speed * -1;
  }
   if (b5 > width || b5 < width/2) {
    b5speed = b5speed * -1;
  }
   if (a6 > width/2  || a6 < 0) {
    a6speed = a6speed * -1;
  }
   if (b6 > width || b6 < width/2) {
    b6speed = b6speed * -1;
  }
   if (a7 > width/2  || a7 < 0) {
    a7speed = a7speed * -1;
  }
   if (b7 > width || b7 < width/2) {
    b7speed = b7speed * -1;
  }
   if (a8 > width/2  || a8 < 0) {
    a8speed = a8speed * -1;
  }
   if (b8 > width || b8 < width/2) {
    b8speed = b8speed * -1;
  }
   if (a9 > width/2  || a9 < 0) {
    a9speed = a9speed * -1;
  }
   if (b9 > width || b9 < width/2) {
    b9speed = b9speed * -1;
  }
   if (a10 > width/2  || a10 < 0) {
    a10speed = a10speed * -1;
  }
   if (b10 > width || b10 < width/2) {
    b10speed = b10speed * -1;
  }
   if (a11 > width/2  || a11 < 0) {
    a11speed = a11speed * -1;
  }
   if (b11 > width || b11 < width/2) {
    b11speed = b11speed * -1;
  }
   if (a12 > width/2  || a12 < 0) {
    a12speed = a12speed * -1;
  }
   if (b12 > width || b12 < width/2) {
    b12speed = b12speed * -1;
  }
}


