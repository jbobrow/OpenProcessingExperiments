
int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
int s1;
int m1;
int h1;
void setup() {
  size(500, 500);
  stroke(255);

  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.70;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.2;

  cx = width / 2;
  cy = height / 2;
}

void draw() {
  s1 = second();  
  m1 = minute();  
  h1 = hour();    
  background(195, 240, 230);
  if (h1 < 12) {
    background(220, 240, 200);
  }
  fill(100, 80, 200);
  noStroke();
  textSize(35);
if (mousePressed){
  m1=m1+mouseY/5; 
  }
  text(nf(h1, 2) + ":" + nf(m1, 2) + ":" + nf(s1, 2), 0, height-1);
  ellipse(cx, cy, clockDiameter, clockDiameter);




  float s = map(s1, 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(m1 + norm(s1, 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(h1 + norm(m1, 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;


  stroke(180, 100, 200, 255);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  strokeWeight(2);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);

  strokeWeight(3);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
  }
  endShape();
}
