
void setup() {
  size(200,200);
}
void draw() {
  float a = 12.0;
  float b = PI/20;
  float c = 0.0;
  for(int d=10; d<=200; d=d+5) {
    for(int y=0; y<=200; y= y+2) {
      float x = d+(sin(c)*a);
      ellipse(x,y,10,10);
      c=c+b;
    }
  }
}


                
