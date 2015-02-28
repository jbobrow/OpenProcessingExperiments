
int s = 50;


void setup() {
  size(500, 500);
  smooth();
}


void draw() {
  background(0);


  for (int i=0;i<9;i++) {
    for (int j=0;j<9;j++) {
      fill(#0DB7AD, 255-25*j);
      ellipse(50+s*i, 50+s*j, 5+4*i, 5+4*i);
    }
  }
}


                
                                
