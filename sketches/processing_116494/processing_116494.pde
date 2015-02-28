
float rc = 150, rm = 100, rd = 90;
float theta, f3 = 0, a3 = 0;

void setup(){
  size(500, 500, P3D);
  frameRate(20);
  background(230, 170, 110);
  smooth();
}

float x2 = 0, y2 = 0;
void draw(){
  fill(230, 170, 110, 150);
  rect(0, 0, width, height);
  f3 = sin(radians(frameCount))*50;
  a3 = sin(radians(frameCount))*50;
  rm = cos(radians(frameCount*.15))+100;
  stroke(250, 100);
  for (int i = 0; i < 4000; i++){
    theta += radians(2);
    float x = (rc - rm) * cos(theta*0.9) + rd * cos((rc-rm)*theta/rm) + a3 * cos(f3*theta);
    float y = (rc - rm) * sin(theta*0.9) - rd * sin((rc-rm)*theta/rm) - a3 * sin(f3*theta);
    line(x + width/2, y + height/2, x2, y2);
    x2 = x + width/2;
    y2 = y + height/2;
  }
}

