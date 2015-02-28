
void setup() {size(800, 800);loop();}

float c=400;
float d=400; 


void draw() {
  
  float a = random(6)-3;
  float b = random(6)-3;
  line(c,d,c+a,d+b);
  line(800-c,800-d,800-(c+a),800-(d+b));
  line(800-c,d,800-(c+a),d+b);
  line(c,800-d,c+a,800-(d+b));
  line(d,c,d+b,c+a);
  line(800-d,800-c,800-(d+b),800-(c+a));
  line(d,800-c,d+b,800-(c+a));
  line(800-d,c,800-(d+b),c+a);
  c = c+a;
  d = d+b;
}
