

int n=0;

float x1;
float y1;
float x2;
float y2;


void setup(){
  
  background(0);
  size(1900,600);
  
  x1=20;
  y1=100;
  x2=100;
  y2=20;
  n=0;
  frameRate(300);
  
  
}

void draw(){
  
  rotate (x1/2); 
  
  line(x1,y1,x2,y2);
  stroke(0,255,0);
  
  x1++;
  x2++;
  y1++;
  y2++;
  
  if (n<1000){
  
  n++;
  
  }

   if (n>=1000){
  
   noLoop();
  
 println(n);
 
  
   } 
}

