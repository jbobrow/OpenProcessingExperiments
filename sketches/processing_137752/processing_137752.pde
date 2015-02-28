
float px, py, px2, py2;
float angle, angle2;
float radius = 50;
float frequency = 2;
float frequency2 = 2;
float x, x2;

void setup(){
  size(500, 300);
  noStroke();
  background (127);
 }

void draw(){
fill(0, 15);
  rect(0,0,width, height);
  noStroke();
  fill(100,150,115,215);
  py = 150 + sin(radians(angle))*(radius);
  
  // draw static curve - y = sin(x)
  for (int i = 0; i< width; i++){
    px2 = width/8 + cos(radians(angle2))*(radius);
    py2 = 75 + sin(radians(angle2))*(radius);
    point(width/8+radius+i, py2);
    angle2 -= frequency2;
  }

  // send small ellipse along sine curve
  // to illustrate relationship of circle to wave
  stroke(150);
  ellipse(width/radius+x, py, 50, 50);
  angle -= frequency;
  x+=1;

}
