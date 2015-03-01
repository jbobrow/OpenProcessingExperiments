
int base1=0;
int base2=0;
double H=0, S=99, B=99;
void setup() {
  size(1000, 1000);
  colorMode(HSB);
  background(0, 0, 0);
  stroke(0, 0, 0);
  strokeWeight(1);
  smooth();
  frameRate(16);
  
  noFill();
}

void draw() {
  background(0, 0, 0);
  for (int i=base1; i<height+60; i+=60) {
    for (int j=base2; j<width+60; j+=60) {

      for (int diameter=100; diameter>0; diameter-=5) {
          if (H>355) {
          H=0;
        }
         H+=360.0/7200.0*2;
        stroke((int)H, (int)S, (int)B);
        ellipse(i, j, diameter, diameter);
        
      }
    }
  }
}
