
float x=0;
float y=0;
float vx=0;
float vy=0;
float a=0.01;
float fric=0.95;


void setup() {
  size(640,450);
  colorMode(HSB,100);
  frameRate(30);
  strokeWeight(5);
  background(0);
}

void draw() {
  vx += a * (mouseX-x);
  vy += a * (mouseY-y);
  vx *= fric;
  vy *= fric;
  
  
  stroke(frameCount%100,80,100);
  line(x,y,x+vx,y+vy);
  
  x += vx;
  y += vy;
}
