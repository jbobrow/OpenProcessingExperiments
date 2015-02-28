
// first ellipse
float circleX = 0;
float circleY = 0;
// second ellipse
float circle2X = 0;
float circle2Y = 0;

void setup(){
  size(600,600);
  
}

void draw(){
  background(random(1,100),random(1,100),random(1,100),random(1,100));
  // first ellipse
  smooth();
  fill(random(100,255),random(100,255),random(100,255),random(100,255));
  stroke(random(100,255),random(100,255),random(100,255),random(100,255));
  ellipse(circleX,circleY,40,40);
  // second ellipse
  fill(random(100,255),random(100,255),random(100,255),random(100,255));
  stroke(random(100,255),random(100,255),random(100,255),random(100,255));
  ellipse(circle2X,circle2Y,40,40);
  
  // first ellipse
  circleX = circleX + 1;
  circleY = circleY + 1;
  if (circleX > 599)
  circleX = 0;
  if (circleY > 599)
  circleY = 0;
  // second ellipse
  circle2X = circle2X + 0.5;
  circle2Y = circle2Y + 0.5;  
  if (circle2X > 599)
  circleX = 0;
  if (circle2Y > 599)
  circle2Y = 0;
  
}

