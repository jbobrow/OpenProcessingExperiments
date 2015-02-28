
int distance = 300;  
float Sx;
float Mx;
float Hx;
float easing = 0.10;
color hourCircle = color(225, 214, 167);
color hourCircle2 = color(0, 117, 62);
color minCircle = color(169, 205, 153);
color minCircle2 = color(137, 195, 111);
color secCircle = color(242, 245, 193);
color secCircle2 = color(223, 229, 99);
color centCircle = color(247, 255, 214);

void setup() {
  size(600, 600);
  noStroke();
  smooth();
}
void draw() {
  background(255);
  float s = map(second(), 0, 59, 10, 360); 
  float m = map(minute(), 0, 59, 10, 360);
  float h = map(hour(), 0, 24, 20, 360); 
  float targetSX = s;
  Sx += (targetSX - Sx) * easing;
  float targetMX = m;
  Mx += (targetMX - Mx) * easing;
  float targetHX = h;
  Hx += (targetHX - Hx) * easing;
  timeCircle(distance, 400, hourCircle, hourCircle2, Sx);
  timeCircle(distance, 270, minCircle, minCircle2, Mx);
  timeCircle(distance, 170, secCircle, secCircle2, Hx);
  timeCircle(distance, 80, centCircle, centCircle, 360);
}
void timeCircle(int xy, int cirlceSize, int leftColor, int progressedColor, float time) {  
  pushMatrix();
  translate(xy, xy);
  rotate(radians(270)); 
  fill(leftColor);
  arc(0, 0, cirlceSize, cirlceSize, 0, radians(360));
  fill(progressedColor);
  arc(0, 0, cirlceSize, cirlceSize, 0, radians(time));
  popMatrix();
}
