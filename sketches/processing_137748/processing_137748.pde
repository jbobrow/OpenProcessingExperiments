
float px, py, px2, py2;
float angle, angle2;
float radius = 50;
float frequency = 2;
float frequency2 = 2;
float x, x2;


void setup(){
  size(500, 300);
  background (127);
}

void draw(){
  fill(0, 8);
  rect(0,0,width, height);
  noStroke();
  py = 150+sin(radians(angle))*(radius);
  fill(200,100,100);
  angle2 = 0;
  for (int i = 0; i< width; i++){
      py2 =sin(radians(angle2))*(radius);
    point(width+radius+i, py2);
    }

  noStroke();
  ellipse(width/radius+x, py, 50, 50);
  angle -= frequency;
  x+=1;
  if (x>= width-60) {
    x = 0;
    angle = 0;
  }
}
