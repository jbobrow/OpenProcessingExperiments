
float a;

void setup() {
  size(540, 160);
  stroke(255, 200, 200);
  a = height/50;
}

void draw() {
  background(200, 100, 150);
  line(5, a, width, a);  
  a = a - 0.5;
  if (a < 0) { 
    a = height; 
  }
}


