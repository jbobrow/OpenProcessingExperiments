
float a = 5.2;
float b = 9.0;

void setup () {
  size(200, 200);
}

void produceMultiply(float a, float b) {
  float total = a*b;
  println(total);
  
}


void draw() {
  background(0);
  produceMultiply(a, b);
}


