

float a = 5+150;

void setup() {
  size(500, 500, P2D);
  background(250);
}

void draw() {
  line(a, a, 0, 500);
  a = a+0.1;
  stroke(180,180,255);
  
    line(0, 300, a, a);
  a = a+0.3;
  stroke(100,0,0);

  line(a, a, 300, 0);
  a = a+0.1;
  stroke(55,200,200);
  
    line(100, 0, a, a);
  a = a+0.5;
  stroke(250,0,0);
}




