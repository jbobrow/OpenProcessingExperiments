
void setup() { 
  size(700, 700);
  background(255);
}
void draw() {
  for (int i = 0; i < 50; i += 2) {
    float a=mouseX+i*3;
    float b=mouseY+sin(i)*20;
    point(a,b);
    strokeWeight(random(1,3));
    stroke(random(0,a+b*2),random(0,b*2),random(0,a*2),150);
  }
}



