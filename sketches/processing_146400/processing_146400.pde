
float vx = 1;
float vy = 1;
float x;
float y;
float diameter = 10;


void setup(){
  size(800, 600);
  background(0);
  frameRate(100);
  x = width/2;
  y = height/2;
}


void draw(){
  resetDisplay();
  wallReflection();
  
  x = x + vx;
  y = y + vy;
  
  fill(255);
  noStroke();
  rectMode(CENTER);
  ellipse(x, y, diameter, diameter);
}


void wallReflection(){
  if(x > width - diameter/2 || x < diameter/2 ){
    vx = -vx;
  }
  if(y > height - diameter/2 || y < diameter/2 ){
    vy = -vy;
  }
}


void resetDisplay(){
  noStroke();
  fill(0);
  rectMode(CORNER);
  rect(0, 0, width, height);
}

