
float a;
void setup () {
  size(640,360);
  stroke(255);
  a =height/2;
}

void draw() {
  background(161);
rect (0,180,width,-a);
  a = a-1;
  if(a<0) {
   a = height/2; 
  }
}

