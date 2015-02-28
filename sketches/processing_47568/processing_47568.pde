
int cx1, cx2, cx3, cx4, cx5, cy1, cy2, cy3, cy4, cy5;
float secondsRadius;
float minutesRadius;
float hoursRadius;

void setup() {
size (600, 600);

//PFont font;
//font = LoadFont("ArialMT-48.vlw");
//textFont(font, 60);

}

void draw() {
  
  background(100);
  smooth();
  
  cx1 = width - 100;
  cy1 = height - 100;
  cx2 = width - 200;
  cy2 = height - 200;
  cx3 = width - 300;
  cy3 = height - 300;
  cx4 = width - 400;
  cy4 = height - 400;
  cx5 = width - 500;
  cy5 = height - 500;
  
  //int s = second();
  
    int radius = 80;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;

  ellipse(cx1,cy1,80,80);
  ellipse(cx2,cy2,80,80);
  ellipse(cx3,cy3,80,80);
  ellipse(cx4,cy4,80,80);
  ellipse(cx5,cy5,80,80);
  ellipse(cx1,cy5,80,80);
  ellipse(cx1,cy4,80,80);
  ellipse(cx1,cy3,80,80);
  ellipse(cx1,cy2,80,80);
  ellipse(cx2,cy1,80,80);
  ellipse(cx2,cy3,80,80);
  ellipse(cx2,cy4,80,80);
  ellipse(cx2,cy5,80,80);
  ellipse(cx3,cy1,80,80);
  ellipse(cx3,cy2,80,80);
  ellipse(cx3,cy4,80,80);
  ellipse(cx3,cy5,80,80);
  ellipse(cx4,cy1,80,80);
  ellipse(cx4,cy2,80,80);
  ellipse(cx4,cy3,80,80);
  ellipse(cx4,cy5,80,80);
  ellipse(cx5,cy1,80,80);
  ellipse(cx5,cy2,80,80);
  ellipse(cx5,cy3,80,80);
  ellipse(cx5,cy4,80,80);

  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

  stroke(100);
  strokeWeight(2);
  line(cx1, cy1, cx1 + cos(s) * secondsRadius, cy1 + sin(s) * secondsRadius);
  line(cx5, cy5, cx5 + cos(s) * secondsRadius, cy5 + sin(s) * secondsRadius);
  line(cx1, cy5, cx1 + cos(s) * secondsRadius, cy5 + sin(s) * secondsRadius);
  line(cx5, cy1, cx5 + cos(s) * secondsRadius, cy1 + sin(s) * secondsRadius);
  line(cx5, cy2, cx5 + cos(s) * secondsRadius, cy2 + sin(s) * secondsRadius);
  line(cx5, cy3, cx5 + cos(s) * secondsRadius, cy3 + sin(s) * secondsRadius);
  line(cx5, cy4, cx5 + cos(s) * secondsRadius, cy4 + sin(s) * secondsRadius);
  line(cx1, cy2, cx1 + cos(s) * secondsRadius, cy2 + sin(s) * secondsRadius);
  line(cx1, cy3, cx1 + cos(s) * secondsRadius, cy3 + sin(s) * secondsRadius);
  line(cx1, cy4, cx1 + cos(s) * secondsRadius, cy4 + sin(s) * secondsRadius);
  line(cx2, cy5, cx2 + cos(s) * secondsRadius, cy5 + sin(s) * secondsRadius);
  line(cx3, cy5, cx3 + cos(s) * secondsRadius, cy5 + sin(s) * secondsRadius);
  line(cx4, cy5, cx4 + cos(s) * secondsRadius, cy5 + sin(s) * secondsRadius);
  line(cx2, cy1, cx2 + cos(s) * secondsRadius, cy1 + sin(s) * secondsRadius);
  line(cx3, cy1, cx3 + cos(s) * secondsRadius, cy1 + sin(s) * secondsRadius);
  line(cx4, cy1, cx4 + cos(s) * secondsRadius, cy1 + sin(s) * secondsRadius);
  
  
 
 line(cx2, cy2, cx2 + cos(m) * minutesRadius, cy2 + sin(m) * minutesRadius);
 line(cx2, cy4, cx2 + cos(m) * minutesRadius, cy4 + sin(m) * minutesRadius);
 line(cx2, cy3, cx2 + cos(m) * minutesRadius, cy3 + sin(m) * minutesRadius);
 line(cx3, cy2, cx3 + cos(m) * minutesRadius, cy2 + sin(m) * minutesRadius);
 line(cx3, cy4, cx3 + cos(m) * minutesRadius, cy4 + sin(m) * minutesRadius);
 line(cx4, cy2, cx4 + cos(m) * minutesRadius, cy2 + sin(m) * minutesRadius);
 line(cx4, cy3, cx4 + cos(m) * minutesRadius, cy3 + sin(m) * minutesRadius);
 line(cx4, cy4, cx4 + cos(m) * minutesRadius, cy4 + sin(m) * minutesRadius);
 
 
 
 
 line(cx3, cy3, cx3 + cos(h) * hoursRadius, cy3 + sin(h) * hoursRadius);

}
  
  

