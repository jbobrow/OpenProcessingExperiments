
void setup() { 
  size(700, 700);
  background(255);
}
void draw() {
  for (int i = 0; i < 50; i += 2) {
    float a=mouseX+i*2;
    float b=mouseY+sin(i)*10;
    point(a,b);
    stroke(random(0,a*2),random(0,b*2),random(0,a+b),150);
    line(0,0,a,b);
  }
}



