
float radius = 1;
float angle = 0;
float speed = 1;
void setup(){
  size(800,600);
  background(0);
  ellipseMode(CENTER);
  smooth();
  noStroke();
  fill(200);
}
void draw(){
  fill(random(0,255),random(0,255),random(0,255));
  float deltaAngle = speed/radius;
  angle += deltaAngle;
  radius += 20/TWO_PI*deltaAngle;
  ellipse(width/2+radius*cos(angle),height/2+radius*sin(angle),7,7);
}



