
float x;
float y;
float xrainbow;
float yrainbow;
float easing;
float easingrainbow;

float targetX;
  float targetY;
  
void setup(){
  size(800,600);
  
  easing = 0.01; 
  easingrainbow = .25;
  background (0);
}

void mousePressed(){
  targetX = mouseX;
   targetY = mouseY; 
}

void draw(){
  x = x + (targetX - x) * easing;
  y = y + (targetY - y) * easing;
  
  stroke(255);
  ellipse(x,y, 30,30);
  
  xrainbow = xrainbow +(targetX-xrainbow) * easingrainbow;
  yrainbow = yrainbow + (targetY-yrainbow) * easingrainbow;
  
  noFill();
  stroke(random(255), random(255), random(255));
  ellipse(xrainbow,yrainbow, 200,200);
  
}



