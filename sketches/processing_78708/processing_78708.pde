
float x1=random(800);
float y1=random(400); 

void setup(){
  size(800,800);
  noFill();
  frameRate(1);
}

void draw(){
  
  background(255);
  
 x1=random(800);
 y1=random(400); 

  bezier(x1,y1,x1+20,y1+random(-100,100),x1+40,y1+random(-100,100),x1+80,y1);
  
}
