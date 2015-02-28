

int x;

void setup() {
  size(300, 300);
  x = width/2;
}
void draw() {
  

  background(97,209,101,150);
  stroke(2);
  strokeWeight(1);
  x = mouseX;


  //Constraint of points on x
  if (x>250) {
    x = 250;
    strokeWeight(50);
    stroke(255, 0, 0);
  }
  // change of composition through stroke 
  if (x<50) {
    x = 50;
    strokeWeight(3);
    stroke(255, 0, 0);
  }

  line(x, 0, x, height);
}

