


float x=0;
float y=0;
int speed = 1;


float a=50;
float s=a;


void setup(){
  
  size(500,500);
  
  
}
void draw(){
  
  background(255);
  
  stroke(0,0,0);
  fill(x,0,0);
  rect((width/2)-(s/2),(height/2)-(s/2),s,s); //Centre the rectangle and grow from centre point
  
  pushMatrix(); //Push this distance from the coordinate
  stroke(0,0,x);
  strokeWeight(5);
  noFill();
  translate(100,100);
  rect((width/2)-(s/2),(height/2)-(s/2),s,s); //Centre the rectangle and grow from centre point
  
  popMatrix();
  stroke(0,x,0);
  strokeWeight(5);
  noFill();
  translate(-100,-100); //Pop this distance from the coordinate
  rect((width/2)-(s/2),(height/2)-(s/2),s,s); //Centre the rectangle and grow from centre point
  
 
  x = x+speed;
  y = y+speed;
  s = s+0.5;
  
  
}


