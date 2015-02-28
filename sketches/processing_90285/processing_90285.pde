
void setup() {
  size(500, 500);
  smooth();
  background(0);
}
 
void draw() {
  float mi =map(millis(),0, 1000, 0, 500);
  float s = map(second(), 0, 60, 0, 400);
  float m = map(minute(), 0, 60, 0, 400);
  float h = map(hour(), 0, 24, 0, 400);
   
  stroke(255);
  line(mi, 400, mi, mi);
  line(s, 115, s, s);
  line(m, 20, m, m);
  line(h, 400, h, h);
}



