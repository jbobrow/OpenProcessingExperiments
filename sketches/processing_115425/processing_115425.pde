
float s1;
float s2;



float x1;
float y1;
  float r=radians(0);

void setup(){
size(500,500);
background(255);  
}
void draw(){
  
  x1=int(random(100,400));
  y1=int(random(100,400));
  
  s1=int(random(50,100));
  s2=int(random(50,100));
  
  arc(x1,y1,s1,s2,0,r);
  r=r+radians(0.5);
  
  
  
  
  
  
}
