
  int x = 10;


float [] radius = new float[100];
float myRotation = 0;
void setup() {
  size(600, 600);
  background(255);
  strokeWeight(3);
  for (int i = 0; i<radius.length; i++) {
    radius[i] = 125 + random (-10, 20);
  }
}

void draw() {

  background(0);
  translate(mouseX, mouseY);
  rotate(myRotation);

  for (int i = 0; i<radius.length; i++) {
    point(radius[i], 0);
    rotate(radians(360f / radius.length));
  }
  fill(random(1, 255), 0, 0);
  if ((x>0) && (x<200)) {
    x=x+1;
  }
  if (x==200) {
    x=x - 5;
  }
  ellipse(0, 0, x, x);

  stroke(255);

  myRotation = myRotation + 0.01;
  
  
  
  
}

