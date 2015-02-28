

void setup() {
  smooth();
}

void draw() {
  background (204);
  int x=mouseX;
  if (x<50) {
  ellipse (30, 70, 50, 50);
}

if (x>50) {
  rect (50, 50, 40, 40);
}

if (mousePressed && (mouseButton == LEFT)) {
  fill(0);
}

else if (mousePressed && (mouseButton == RIGHT)) {
    fill(255);
  } 

}
                
                
