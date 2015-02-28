
int value = 255;

void setup() {
  size(550,600);
  background(0);
  smooth();
}

void draw() {
  float a = 150;
  float b = 250;
  float c = 275;
  float d = 325;
  stroke(value);
  noFill();
  for (int i = 1; i < 5; i = i + 1) {
    println(i);
    a += 25;
    b -= 20;
    c += 25;
    d -= 20;
    line(a,b,a,b+100);
    line(a,b,c,d);
    line(c,d,c,d+100);
    line(a,b+100,c,d+100);  
  }
  
}

void mouseMoved() {
  value = abs(mouseX-255);
}
