
float a = random(0,255);
float b = random(0,255);
float c = random(0,255);
int l_color = color(a,b,c);

void setup() {
  size(610,610);
  background(0);
  strokeWeight(.1);
  frameRate(30);
}

void draw() {
  background(0);
  stroke(l_color);
  line(5,5,mouseX,mouseY);
  line(55,5,mouseX,mouseY);
  line(105,5,mouseX,mouseY);
  line(155,5,mouseX,mouseY);
  line(205,5,mouseX,mouseY);
  line(255,5,mouseX,mouseY);
  line(305,5,mouseX,mouseY);
  line(355,5,mouseX,mouseY);
  line(405,5,mouseX,mouseY);
  line(455,5,mouseX,mouseY);
  line(505,5,mouseX,mouseY);
  line(555,5,mouseX,mouseY);
  line(605,5,mouseX,mouseY);
  line(5,605,mouseX,mouseY);
  line(55,605,mouseX,mouseY);
  line(105,605,mouseX,mouseY);
  line(155,605,mouseX,mouseY);
  line(205,605,mouseX,mouseY);
  line(255,605,mouseX,mouseY);
  line(305,605,mouseX,mouseY);
  line(355,605,mouseX,mouseY);
  line(405,605,mouseX,mouseY);
  line(455,605,mouseX,mouseY);
  line(505,605,mouseX,mouseY);
  line(555,605,mouseX,mouseY);
  line(605,605,mouseX,mouseY);
  line(5,55,mouseX,mouseY);
  line(5,105,mouseX,mouseY);
  line(5,155,mouseX,mouseY);
  line(5,205,mouseX,mouseY);
  line(5,255,mouseX,mouseY);
  line(5,305,mouseX,mouseY);
  line(5,355,mouseX,mouseY);
  line(5,405,mouseX,mouseY);
  line(5,455,mouseX,mouseY);
  line(5,505,mouseX,mouseY);
  line(5,555,mouseX,mouseY);
  line(5,605,mouseX,mouseY);
  line(605,55,mouseX,mouseY);
  line(605,105,mouseX,mouseY);
  line(605,155,mouseX,mouseY);
  line(605,205,mouseX,mouseY);
  line(605,255,mouseX,mouseY);
  line(605,305,mouseX,mouseY);
  line(605,355,mouseX,mouseY);
  line(605,405,mouseX,mouseY);
  line(605,455,mouseX,mouseY);
  line(605,505,mouseX,mouseY);
  line(605,555,mouseX,mouseY);
  line(605,605,mouseX,mouseY);
}

void mousePressed() {
  if(l_color == color(a,b,c)) {
    l_color = color(c,a,b);
  }else{
    l_color = color(b,c,a);
  }
  a = random(0,255);
  b = random(0,255);
  c = random(0,255);
}

