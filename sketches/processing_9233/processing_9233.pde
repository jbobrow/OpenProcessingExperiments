
float r= 100;
float g= 150;
float b= 200;
float a= 200;

float diam = 20;
float x= 100;
float y= 100;

void setup() {
  size(200,200);
  background(255);
  smooth();
}

void draw() {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(20);
  x = random(width);
  y = random(height);
  
  stroke(0);
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
  
  if (!mousePressed) {
    ellipse (width/2,height/2,100,r);
  } else {
    rect (width/2,height/2,100,r);
  }
  
}

