
void setup() {
  size(700,700);
  stroke(255);
}

void draw() {
  
  float s = map(second(), 0, 60, 0, 100);
  float m = map(minute(), 0, 60, 0, 100);
  float h = map(hour(), 0, 24, 0, 100);
  background(s*10, 10*s, 50+s);
  float old_y = 0;
for (int x=0; x<width; x++) {
  float y = cos(x*s + 5) * 100 + height/2;
  line(x+100, y+1, (x-25), old_y);
  old_y = y;
  stroke(23, s*1.5, 100);
  strokeWeight(1);
  
}
float mr_f = 0;
for (int x=0; x<width; x++) {
  float f = cos(x + 5*m) * 300 + height/2;
  line(x, m, (x-25), mr_f);
  mr_f = f;
  stroke(255, 190, 80);
  strokeWeight(1);
}

float mr_m2 = 0;
for (int x=0; x<width; x++) {
  float m2 = cos(x*h + 5*h) * 140 + height/4;
  line(x, m2+1, (x-25), m2);
  mr_f = m2;
  stroke(20, 190, 180);
  strokeWeight(3);
}

}


