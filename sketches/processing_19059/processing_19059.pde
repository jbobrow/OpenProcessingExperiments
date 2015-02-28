
//EASING THE SPEED
float easing = 0.1;
float speed = 0.0;

void setup()
{
  size(400,400);
  smooth();
}
void draw()
{
  background(0);
  float target = dist(mouseX,mouseY,pmouseX,pmouseY);

  speed += (target - speed) * easing;

  float d = speed * 3;
  ellipse(width/3, height/2, d,d);
  ellipse(2*width/3, height/2, target,target);
}


