

int n=0;

float x1;
float y1;
float x2;
float y2;


void setup(){
  
  background(0);
  size(720,576);
  
  x1=20;
  y1=100;
  x2=100;
  y2=20;
  n=0;
  frameRate(3000);
  
  
}

void draw(){
  
  rotate (x1);  
  
  line(x1,y1,x2,y2);
  stroke(0,255,0);
 
  
  x1=x1+0.1;

  x2=x1+0.1;
 
  
  
  if (n<10000){
  
  n++;
  
  }

   if (n>=10000){
  
   noLoop();
  
 println(n);
 
  
   } 
}

