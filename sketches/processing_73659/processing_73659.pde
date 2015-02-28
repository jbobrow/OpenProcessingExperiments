
int counter;

void setup () {
  size(500, 500);
  smooth();
  background(86, 170, 183);
}
void draw() {
  
    fill(0);
    rect(0, 0, 500, 500);
    
    for (int a=0; a<=500; a+=15) {
    for (int b=0; b<=500; b +=15) {
    stroke(86, 170, 183, 100);
   
        if (mousePressed==true) {
        stroke(253, 209, 0, 180);
        line(a, b, 250, 250);
      }
    }
  }
}
