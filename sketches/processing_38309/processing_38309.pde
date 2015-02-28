
int s = 50;


void setup() {
  size(500, 500);
  smooth();
}


void draw() {
  background(0);

  for (int i=0;i<=width/s;i++) {
    stroke(#0DB7AD);
    line(0+i*s, 0, width, 0+i*s);
  }
  
}


                
                                                
