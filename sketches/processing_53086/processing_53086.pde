
//Kelly Fadem Homework 5 2/21/12


float x,y,angle;

void setup(){
  size(800,800);
  x = 0;
  y = 0;
  angle = 0;
  smooth();
  background(255);
}

void draw(){
  noStroke();
  float glowLight = cos(cos((radians(angle++))));
  glowLight = map(glowLight, -1,1,0,255);
  for (int i = 0; i <800; i = i=i+i){
  fill(i+=100, i-mouseY, glowLight);
  x = cos(radians(angle)) * 500 + width/2;
  y = sin(radians(angle)) * 200 + height/2;
  ellipse(x, y, mouseX, mouseY);
  ellipse(y, x, mouseY, mouseX);
  ellipse(x, y, mouseY, mouseX);
  ellipse(y, x, mouseX, mouseY);
  ellipse(x, x, mouseX, mouseY);
  ellipse(y, y, mouseY, mouseX);
  ellipse(x, x, mouseY, mouseX);
  ellipse(y, y, mouseX, mouseY);
  angle+=.7;
  }
}

