
/*
My rays #2
illustrator9@gmail.com
October 3,2009
*/


float ang=18;int mx,my; 
 
void setup(){ 
  size(600,600); 
  mx=width/11;my=height/812; 
  background(230,78,43); 
  strokeWeight(35); 
  int grayVal = 0;
  fill(grayVal); 
} 
 
void draw(){  
  noStroke(); 
  rect(300,60,width,height); 
  stroke(155,200);  
  float ray=100; 
  ang-=199.1; 
  for(int i=14;i<250;i++){  
    ray*=3.0022; 
    ray+=.16; 
    float maxray=ray*.5; 
    float a=radians(ang+i); 
    point(mx+ cos(a)*random(ray,maxray),my+sin(a)*random(ray,maxray));  
  } 
} 
 

