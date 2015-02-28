
  float x = 0;
  float y = 0;
  float dx = random(5);
  float dy = random(5);

void setup(){
  background(0);
  size(400,400);
  smooth();
  stroke(255,0,0);
  noFill();
}

void draw(){
  background(0);
  if( x > width || x < 0) { dx *= -1; } 
  if( y > height || y < 0) { dy *= -1; } 
  x += dx;
  y += dy;
  ellipse( x,y,50,50);
}


