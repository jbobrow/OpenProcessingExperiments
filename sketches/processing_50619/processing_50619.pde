
//inner circle
int x;
int y;
int directionx;
int directiony;
//2nd circle
int c;
int d;
int directionc;
int directiond;
//3rd circle
int a;
int b;
int directiona;
int directionb;
//4th circle
int e;
int f;
int directione;
int directionf;
//growing circle
int colorValue;

//runs once
void setup(){
  size (600,600);
  //growing circle commands
  colorValue=0;
  //inner circle commands
  x=100;
  y=250;
  directionx=1;
  directiony=1;
  // 2nd circle commands
  c=100;
  d=250;
  directionc=1;
  directiond=1;
  //3rd circle commands
  a=100;
  b=250;
  directiona=1;
  directionb=1;
  //4th circle commands
  e=100;
  f=250;
  directione=1;
  directionf=1;
}

void draw(){
  smooth();
  background(0);
  colorValue++;
  
  e += directione;
  f += directionf;
  //4th white ring
  stroke (255);
  strokeWeight (20);
  noFill ();
  ellipse (e,f,200,200);
  
  a += directiona; 
  b += directionb;
  //3rd white ring
  stroke (255);
  strokeWeight (15);
  noFill ();
  ellipse (a,b,150,150);
  //bounce command
   if (b > 600){
    directionb=-1;
  }
 
  
  c += directionc;
  d += directiond;
  //2nd white ring
  stroke (255);
  strokeWeight (10);
  noFill();
  ellipse (c,d,100,100);
  //bounce command
  if (d > 600){
    directiond=-1;
  }
  if (c > 600){
    directionc=-1;
  }
  
  x += directionx; //x= x + directionx; (another way of writing it)
  y += directiony;
  //smallest white ring
  stroke (255);
  strokeWeight (5);
  noFill();
  ellipse (x,y,50,50);
  
  //growing ellipse
  stroke (255);
  strokeWeight (2);
  noFill ();
  ellipse (x,y,colorValue,colorValue);
  stroke (255);
  strokeWeight (5);
  noFill ();
  ellipse (x,y,50+colorValue,50+colorValue);
  stroke (255);
  strokeWeight (10);
  noFill ();
  ellipse (x,y,100+colorValue,100+colorValue);
  stroke (255);
  strokeWeight (15);
  noFill ();
  ellipse (x,y,150+colorValue,150+colorValue);
  stroke (255);
  strokeWeight (20);
  noFill ();
  ellipse (x,y,200+colorValue,200+colorValue);
   
  //bounce command off all walls (inner Circle)
  if(y > 600){
    directiony=-1;
  } 
  if(x > 600){
    directionx=-1;
  }
  if(y < 0){
    directiony=1;
  }
  if(x < 0){
    directionx=1;
  }

}

