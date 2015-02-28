
float w = 650,h = 250;
  
void setup() { 
  size(650,150,P2D);
  background(0); 
 
 
}
  
void draw() { 
  background(0);
  noStroke();
  fill(0);
    
    
  for(float i =1  ; i < 60 ; i++) {
  if(i%5==0)
  {
  fill(35,35,135);
  }
  else
  {
  fill(222,22,10);
  }
    
  float r = 125*(sin(millis()/(400+i)));
  float x = w/2+(w/2)*sin(millis()/(700+i));
    ellipse( x,h/3.3,r,r);
  }
}


