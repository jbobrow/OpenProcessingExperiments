
/*
My rays #3
illustrator9@gmail.com
October 3,2009
*/


float ang=18;int mx,my; 
 
void setup(){ 
  size(600,600); 
  mx=width/11;my=height/1; 
  background(34,178,43); 
  strokeWeight(135); 

  fill(23,56,3); 
} 
 
void draw(){  
  noStroke(); 
  rect(30,1,width,height); 
  stroke(4,230);  
  float ray=30; 
  ang-=1.1; 
  for(int i=8;i<350;i++){  
    ray*=1.0022; 
    ray+=3.16; 
    float maxray=ray*12.5; 
    float a=radians(ang+i); 
    point(mx+ cos(-a)*random(ray,maxray),my+sin(-a)*random(ray,maxray));  
  } 
} 
 

