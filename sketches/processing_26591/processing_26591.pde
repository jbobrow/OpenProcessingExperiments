
float c,d = random(0,400);

void setup() {
  size(400,400);
  background(0,0,0);
}

void draw() {
  float a = random(0,400);
  float b = random(0,400);
  stroke(255);
  line(a,b,c,d);
  c = a;
  d = b;
  
}         
                
