
float x = random(width);
float y = random(height);
float r = 10;

float xspeed = 3;
float yspeed = 1;
float gravity = 0.1;

void setup(){
  size(450,300);
  smooth();
}

void draw(){
  background(100);
  rectMode(CENTER);
  fill(x,y,255);
  rect(width/2,height/2,75,75);
  fill(80,255,68);
  noStroke();
  ellipseMode(CENTER);
  ellipse(x,y,10,10);
  r = constrain(r,10,10);
  
  x = x + xspeed;
  y = y + yspeed;
  
  yspeed = yspeed + gravity;
  xspeed = xspeed + gravity;
  

  
  if (x >= width || x <= 0) {
    xspeed = xspeed * -0.99;
    r = 50;
  }
  if (y >= height || y <= 0) {
    yspeed = yspeed * -0.99;
    r = 50;
  }
}

