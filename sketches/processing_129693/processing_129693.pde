
//HW #3 Kevin Kan Copyright © 2014//

float x, y, wd, ht;
float easing = .1;
void setup (){
  
  
  
  
  size (400, 400);
  background(255,255,255);
  frameRate(20);
  strokeWeight(1);
  
 
  wd=100;
  ht=200;
}

void draw(){
  
  
  float targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  
 
  
  //
  
  
  fill(255,255,255,30);
  rect(0,0,width,height);
  
  
  //center
  stroke( random(255), random(255), random(255));
  line(x, y, 0,0);
  
  stroke( random(255), random(255), random(255));
  line(x, y, 400,0);
  
  stroke( random(255), random(255), random(255));
  line(x, y, 400,400);
  
  stroke( random(255), random(255), random(255));
  line(x, y, 0,400);
  
  stroke( random(255), random(255), random(255));
  line(x, y, 200,0);
  
  stroke( random(255), random(255), random(255));
  line(x, y, 400,200);
  
  stroke( random(255), random(255), random(255));
  line(x, y, 200,400);
  
  stroke( random(255), random(255), random(255));
  line(x, y, 0,200);
  
  
    
}   


void mousePressed(){
  noStroke();
  fill(random(255), random(255), random(255));
  rect(0, 0, width, height);
}


