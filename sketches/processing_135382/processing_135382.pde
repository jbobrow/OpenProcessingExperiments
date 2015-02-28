
float px, py;
float angle;
float radius = 50;
float frequency = 2;
float x;
float a, b;

void setup(){
  size(720,480);
  background(200);
  angle=0;
}

void draw(){
  background(200);
  a=mouseX;
  b=mouseY;
  radius=sqrt(sq(a/2)+sq(b/2));
  angle--;
  fill(255,90);
  rectMode(CORNER);
  rect(0,0,a,b);
  noStroke();
  fill(75,250,200);
  ellipseMode(RADIUS);
  ellipse(a/2,b/2, radius/2, radius/2);
  
  px = a/2+ cos(radians(angle))*(radius)/2;
  py = b/2 + sin(radians(angle))*(radius)/2;
  
  ellipseMode(CENTER);
  fill(240,20,80,100);
  //draw rectangle
  ellipse (px, py, radius/10-5, radius/10-5);
}


