

int clockX;
int clockY;
float secondR;
float minuteR;
float hourR;
float clockSize;

void setup() {
  size(600, 600);
  
int radius = min(width, height) / 2;
  secondR = radius * 0.72;
  minuteR = radius * 0.60;
  hourR = radius * 0.50;
  clockSize = radius * 1.8;
  
  clockX = width / 2;
  clockY = height / 2;
}

void draw() {
  background(104,180,175);
  
  fill(242,241,214);
  noStroke();
  ellipseMode(CENTER);
  ellipse(clockX, clockY, clockSize, clockSize);
  fill(80);
  ellipse(clockX, clockY, clockSize*0.7, clockSize*0.7);
   fill(0);
  ellipse(clockX, clockY, clockSize*0.4, clockSize*0.4);
  
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  fill(255);
  stroke(255);
  strokeWeight(5);
  
  line(clockX, clockY, clockX + cos(m) * minuteR, clockY + sin(m) * minuteR);
  strokeWeight(15);
  
  line(clockX, clockY, clockX + cos(h) * hourR, clockY + sin(h) * hourR);
 
   fill(104,180,175);
   ellipse(clockX+10+ cos(s) * secondR, clockY+10+ sin(s) * secondR,30,30);
   strokeWeight(2);
}


