
int time1 = 5000;
int time2 = 10000;
float angle = 0.0;
float offset = 10;
float scalar = 1; 
float speed = 5.5;

void setup() {
  
  size(800, 800);
  background(0, 25, 55);
  stroke(225, 0, 0);
  smooth();
}


void draw(){
  int currentTime = millis();
  if (currentTime < time1) {
  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  fill(255, 25, 0);
  ellipse(400 + x, 400 + y, 10, 10);
  angle += speed*-.05;
  scalar += speed*-.05;
stroke(0, 255, 0);
  ellipse(395 + x, 395 + y, 30, 30);
  
  
} 
{
  
  if (currentTime > time1) {
  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  fill(25, 255, 0);
  ellipse(400 + x, 400 + y, 10, 10);
  angle += speed*-.05;
  scalar += speed*-.05;
stroke(0);
  ellipse(395 + x, 395 + y, 30, 30);
}
}
{if (currentTime > time2) {
  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  fill(25, 0, 255);
  ellipse(400 + x, 400 + y, 10, 10);
  angle += speed*-.05;
  scalar += speed*-.05;
stroke(0);
  ellipse(395 + x, 395 + y, 30, 30);
}
}
}



