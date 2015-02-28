
float x = 0;
 float xgamba = 0;
 float speed = 0;
 float ygamba = 0;
 float zgamba = 0;
 float gambaK = 0;
 float gambaM = 0;
 float gambaN = 0;
 float brax = 0;
 float bray = 0;
 float braz = 0;
 float braA = 0;
 float braB = 0;
 float braC = 0;
 
   //x
  float A = -30;
  float a = 50;
  float b = 75;
  float c = 150;
  float d = 200;
  float e = 125;
  
 void setup () 
{
size (400,400);
}
  

void draw ()
{
  background(255,255,255);
 
  
  x = x + 0.05;
  
  speed = speed +0.01;
  
  A = A + speed;
  
  zgamba = 25 * sin(x);
  
  xgamba = zgamba + A;
  
  ygamba = sqrt(d*d-zgamba*zgamba);
  
  
  ellipse(A,a,50,50);
  
  //dorso
  line(A,b,A,c);
  
  //1 gamba
  
  line(A,c,xgamba,ygamba);
  
  gambaK = 25 * sin(x-3);
  
  gambaM = gambaK + A;
  
  gambaN = sqrt(d*d-gambaK*gambaK);
  
  //2gamba
  
  line(A,c,gambaM,gambaN);
  
  //braccio
  
  braz = 25 * sin(x-3);
  
  brax = braz + A;
  
  bray = sqrt(e*e-braz*braz);
  
  line(A,b,brax,bray);
  
  //braccio2
  
  braA = 25 * sin(x);
  
  braB = braA + A;
  
  braC = sqrt(e*e-braA*braA);
  
  line(A,b,braB,braC);
  
}
