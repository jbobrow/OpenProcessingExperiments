
void setup(){
size(500, 500);
}

void draw() {

float d = dist(width/2, height/2, mouseX, mouseY);
float old_y = 0;
background(30, d*2, 190);


for (int x=0; x<width; x++) {
  float y = cos(x*d + 5) * 100 + height/2;
  line(x+100, y+1, (x-25), old_y);
  old_y = y;
  stroke(23, d*1.5, 100);
  strokeWeight(1);
  
}

float mr_m = 0;
for (int x=0; x<width; x++) {
  float m = cos(x + 5*d) * 100 + height/2;
  line(x, m+1, (x-25), mr_m);
  mr_m = m;
  stroke(255, 190, 80);
  strokeWeight(1);
}



float mr_m2 = 0;
for (int x=0; x<width; x++) {
  float m2 = cos(x*d + 5*d) * 140 + height/2;
  line(x, m2+1, (x-25), m2);
  mr_m = m2;
  stroke(20, 190, 180);
  strokeWeight(3);
}
}



