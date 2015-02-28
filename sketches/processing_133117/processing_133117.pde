
int x=0;
int speed=3;
  
void setup(){
  size(400,400);
}

void draw(){
  noStroke();
  background(255); 
  frameRate(30); 
  fill(255,215,0);
  ellipse(x,200,50,50); 
  fill(255);
  triangle(x,200,x+25,215,x+25,185);
  x=x+speed;
  if ((x<0)||(x>=400)){ 
    speed=speed*-1;
 }

  noStroke();
  frameRate(30); 
  fill(0);
  rect(0,0,400,150);
  rect(0,250,400,400);
  ellipse(x+50,200,10,10); 
  x=x+speed;
  if ((x<0)||(x>=400)){ 
    speed=speed*-1;
  }
}
