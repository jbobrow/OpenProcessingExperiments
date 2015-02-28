
public class Dot{
int x, y, xDir, yDir;
float xStep, yStep;
color c;
boolean pressed;
public Dot(int _x, int _y, color _c, boolean _pressed){
  this.x = _x;
  this.y = _y;
  this.c = _c;
  xStep = random(5);
  yStep = random(5);
  xDir = 1;
  yDir = 1;
  pressed = _pressed;
}
public void move(){
  if(pressed)return;
  x += xStep * xDir;
  y += yStep * yDir;
  if(x>width || x < 0)xDir *= -1;
  if(y > height || y < 0)yDir *= -1;
}
}

