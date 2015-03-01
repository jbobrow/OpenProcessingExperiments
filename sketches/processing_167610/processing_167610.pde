
float a = .1;

void setup() {
  size(400, 400);
  background(0);

}

// spin
void draw() {
  // a add .0001
  a = a + .0001;
  translate(width/2, height/2);
  // rotate by a
rotate(PI/a);
rect(30, 20, 55, 55);
stroke(255,100,100);

}


