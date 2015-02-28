


void setup(){
  size(400,400);
  background(0);
}

void draw(){
  

  
  float x= map(second(),0,59,0,200);
  float y= map(minute(),0,59,0,150);
  float z= map(hour(),0,59,0,100);
  ellipse(x+150, x,x,x);
  fill(random(20,150),random(20,150),random(20,150));
  ellipse(y+150, y,120,120);
  fill(150,150,150);
  ellipse(z+150, height/4+100,50,50);
  fill(random(20,255),random(20,255),random(20,255));
}
  
  
  




