
float endx = 0, endy = 0;
float angle = 0;

void setup() {
  size(600,600);
  smooth();
  noCursor();
  background(0);
  noStroke();
  ellipse(width/2,height/2,width/4,width/4);
}

void draw() {
  stroke(random(256), random(256), random(256));
  endx = cos(radians(angle)) * width;
  endy = sin(radians(angle)) * height;
  //lineAngle(width/2, height/2, endx, endy);
  lineAngle(width/6, height/6, angle, 1000);
  lineAngle(width/6, height/6, (millis()/1000.0), 50);
  lineAngle(int(width * 0.833333), height/6, (millis()/1000.0), 50);
  lineAngle(width/6, int(width * 0.833333), (millis()/1000.0), 50);
  lineAngle(int(width * 0.833333), int(height * 0.833333), (millis()/1000.0), 50);
  stroke(random(256),random(101));
  lineAngle(width/6, height/6, angle, 1000);
  angle += 0.1;
  if (angle > 359)
    angle = 0;
  
}

void lineAngle(int x, int y, float angle, float length)
{
  line(width/2, height/2, x+cos(angle)*length, y-sin(angle)*length);
}


