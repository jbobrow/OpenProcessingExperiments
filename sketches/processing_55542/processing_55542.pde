
float angle = 40;
float offset = 200;
float scalar = 5;
float speed = 0.2;

int time1=0;
int time2=5000;
int time3=6000;
int time4=9000;

void setup() {
  size(400,400);
  fill(255);
  background(#1283DE);
  smooth();
  noStroke();
}

void draw() {
  int currentTime = millis();
  noStroke();
  frameRate(500);
  float x = offset +cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  ellipse(x,y,3,3);
  angle -= speed;
  scalar -= speed; 
  
  
  float speed = 0.01;
  float a = offset +cos(angle) * scalar;
  float b = offset + sin(angle) * scalar;
  ellipse(x,y,3,3);
  fill(255);
  angle += speed;
  scalar += speed; 
  
  stroke(255);
  strokeWeight(0.1);
  line(random(1,400),random(1,400),200,200);

  if (currentTime > time2) {
  scalar +=3;
  }
}


