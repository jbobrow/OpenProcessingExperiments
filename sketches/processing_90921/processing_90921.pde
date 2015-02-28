
float angle = 0.0;
float offset = 60;
float scalar = 30;
float speed = 0.05;
PImage robot;

void setup() {
  robot = loadImage("robot8.png");
  size(620, 620);
  smooth();
  background(0);
}


void draw() {
  background(0);
  line(x, 20, width, 20);
  line(x, 220, width, 220);
  line(x, 420, width, 420);
  line(x, 600, width, 600);
  stroke(255, 128, 0);
  strokeWeight(9); {
    
  
  float y1 = offset + sin(angle) * scalar;
  float y2 = offset + sin(angle + 0.4) * scalar;
  float y3 = offset + sin(angle + 0.8) * scalar;
  ellipse( 280, y1, 50, 40);
  fill(255, 36, 0);
  ellipse(320, y2, 40, 40);
  fill(255, 255, 0);
  ellipse(360, y3, 40, 40);
  fill(0, 139, 0);
  angle += speed;
}
  {
    
  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  ellipse( 540, 500, x, y);
  fill(153, 50, 204);
  
  
  ellipse( x, 400, 40, 40);
  fill(255, 20, 147);
  angle += 0.01;
  }
  
  
  {
  scale(sin(angle) + 2.5);
  imageMode(CENTER);
  image(robot, 90, 120);
  angle += 0.01;
  }
  
{
  rotate(angle + 2);
  rect(55, 45, 120, 120);
  fill(139, 87, 66);  
 }
}









