
// Ellipsen sind Sekundenbhänig dargestellt, während die Quadrate Minutenabhängig sind
// MousePressed Interaktion
float xcenter;   
float ycenter;   
float rad = 180;   
float angle; 
void setup () {
size(500, 500);
smooth ();
noStroke ();
background (255);
xcenter = width / 2;
ycenter = height / 2;
}
void draw () {
if(mousePressed)  {
  noStroke();
fill (255, 40);
rect (0, 0, width, height);
int sec= minute();
angle += sec;
float flipx = ((float) 499 / width) * rad;
float flipy = ((float) 499 / height) * rad;
float x = xcenter + cos (angle) * flipx;
float y = ycenter + sin (angle) * flipy;
fill( random(255), random(255), random(255), random(255));
rect (x, y, 22,22);
fill(255);
noStroke();
translate(width/ 2, height/2);
float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;
stroke(0);
strokeWeight(1);
line(20, 0, cos(s) * 160, sin(s) * 160);
strokeWeight(2);
line(20, 0, cos(m) * 120, sin(m) * 120);
strokeWeight(4);
line(20, 0, cos(h) * 100, sin(h) * 100);
}
else{
   fill (233, 10);
  rect (0, 0, width, height);
  angle += second();
  float s = xcenter + cos (angle) * rad;
  float d = ycenter + sin (angle) * rad;
  fill (0);
  ellipse (s, d, 15, 15);
}
}
