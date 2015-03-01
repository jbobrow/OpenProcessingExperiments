
float inc = 0.0;
void setup() {
  size(900,900);
  stroke(255,204);
  smooth();
}
void draw() {
  background(0);
  inc += 0.01;
  float angle = sin(inc)/100.0; // + sin(inc)/100.0;
  //tail(118, 9, angle/TWO_PI);
  tail(300, 100, angle*TWO_PI);

  //tail(144, 10, angle/1.3);
  //tail(162, 5, angle);
  //tail(188, 7, angle*2);
}
 
void tail(int x, int units, float angle) {
  pushMatrix();
  translate(x - angle*4000, 100);
  scale(1 - angle*5);
  translate(x, 100);
  stroke(255, 255, 255, 100);
    line(250, 350, 255, 300);
    line(255, 300, 300, 320);
    line(300, 320, 350, 300);
    line(350, 300, 355, 350);
  strokeWeight(10);
  stroke(255, 255, 255, 10);
    line(250, 350, 255, 300);
    line(255, 300, 300, 320);
    line(300, 320, 350, 300);
    line(350, 300, 355, 350);
  for (int i = units; i>0; i--) {
    strokeWeight(10);
    stroke(25, 255, 255, 100);
    line(250, 350, 255, 300);
    line(255, 300, 300, 320);
    line(300, 320, 350, 300);
    line(350, 300, 355, 350);
    
    strokeWeight(2);
    stroke(250, 20, 20);
    line(250, 350, 255, 300);
    line(255, 300, 300, 320);
    line(300, 320, 350, 300);
    line(350, 300, 355, 350);
    translate(10, -8);
    rotate(angle);
  }
  popMatrix();
}


