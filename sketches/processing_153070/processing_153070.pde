
float x, y;
float angle = 0;
float scalar = 0;
float speed = 5;
 
void setup(){
  size(800,800);
  frameRate(250);
  background(0);
  stroke(500);
}
void draw(){
  fill (random(255), random(255), random (255));
  x = width/2 + cos(angle) * scalar;
  y = height/2 + sin(angle) * scalar;
  ellipse( x, y, 9, 9);
  angle += speed;
  scalar += 0.09;
}

