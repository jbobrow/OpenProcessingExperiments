
int a=1000;
float s=5;
float x;
float y;

void setup() {
  background(135,135,135);
  size(500, 500);
  frameRate(150);
}

void draw() {
  for (int i=0; i<a; i++) {
    stroke(random(0,255));
    x=random(0,a);
    y=random(0,a);
    line(x,y,x+random(0,s),y);
  }
}
  
