
int xy = 50;
float y1 = 50;
float y2 = 50;
float y3 = 50;
float y4 = 50;
float y5 = 50;
float y6 = 50;
float y7 = 50;
float y8 = 50;
float y9 = 50;
float y0 = 50;
float speed = 3;
int y1direction = 1;
int y2direction = 1;
int y3direction = 1;
int y4direction = 1;
int y5direction = 1;
int y6direction = 1;
int y7direction = 1;
int y8direction = 1;
int y9direction = 1;
int y0direction = 1;

void setup() { 
  size(190, 600); 
  smooth(); 
}

void draw() { 
  background(0,210,150);
  fill(255,150);
  stroke(250); 
  ellipse(110, y1-25, xy, xy);
  line(110,y1-50,110,0);
  ellipse(70, y2-25, xy, xy);
  line(70, y2-50, 70, 0);
  ellipse(130, y3-25, xy, xy);
  line(130, y3-50, 130, 0);
  ellipse(30, y4-25, xy, xy);
  line(30, y4-50, 30, 0);
  ellipse(140, y5-25, xy, xy);
  line(140, y5-50, 140, 0);
  ellipse(80, y6-25, xy, xy);
  line(80, y6-50, 80, 0);
  ellipse(40, y7-25, xy, xy);
  line(40, y7-50, 40, 0);
  ellipse(160, y8-25, xy, xy);
  line(160, y8-50, 160, 0);
  ellipse(115, y9-25, xy, xy);
  line(115, y9-50, 115, 0);
  ellipse(90, y0-25, xy, xy);
  line(90, y0-50, 90, 0);
  y1 += speed * y1direction;
  y2 += speed * y2direction*1.2;
  y3 += speed * y3direction*1.3;
  y4 += speed * y4direction*1.4;
  y5 += speed * y5direction*1.5;
  y6 += speed * y6direction*1.6;
  y7 += speed * y7direction*1.7;
  y8 += speed * y8direction*1.8;
  y9 += speed * y9direction*1.9;
  y0 += speed * y0direction*2;
  if ((y1>height) || (y1<xy)) {
      y1direction = -y1direction;
  }
  if ((y2>height) || (y2<xy)) {
      y2direction = -y2direction;
  }
  if ((y3>height) || (y3<xy)) {
      y3direction = -y3direction;
  }
  if ((y4>height) || (y4<xy)) {
      y4direction = -y4direction;
  }
  if ((y5>height) || (y5<xy)) {
      y5direction = -y5direction;
  }
  if ((y6>height) || (y6<xy)) {
      y6direction = -y6direction;
  }
  if ((y7>height) || (y7<xy)) {
      y7direction = -y7direction;
  }
  if ((y8>height) || (y8<xy)) {
      y8direction = -y8direction;
  }
  if ((y9>height) || (y9<xy)) {
      y9direction = -y9direction;
  }
  if ((y0>height) || (y0<xy)) {
      y0direction = -y0direction;
  }
}

