
int x = 30;
int y = 30;

int x2 = 30;
int y2 = 30;

int x3 = 30;
int y3 = 590;


int count = 0;

void setup() {
  
  size(600,600);
  background (234);
  
  smooth();
  fill(0,90,212,2);
  rectMode(CENTER);
  frameRate(10);
  
}

void draw() 


{
 while (count<250){
   
   
  smooth();
  line(x,y,590,60);
  
  /*line(20,20,5,495);*/
  line(x2,y2,30,590);
  
  
  /*line(10,10, 20,580);*/
  line(30,30, x3,y3);
  
  
  
  /*line(10,10, 20,580);*/
  line(30,30, x3,y3);
  
  
  x= x + 2;
  y= y + 2;
  
  x2= x2 + 2;
  y2= y2 + 2;
  
   count++;

 }
 
}

