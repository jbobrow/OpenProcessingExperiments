
float time = 0;
float z = 0;
void setup() {

  size (500, 500);
  background(#7AF0FC);
}

void draw() {
  background(#7AF0FC);

  fill(#7AF0FC);
  rect(0, 0, width, 70);
  z=z+1;
  float x = 0;
  fill(#F7A437);
  ellipse(z, 30, 60, 60);
  if (z>510) {
    z = 0;
  }
  while (x <width) {

    stroke(#212FBF);
    line(x, 200+50*noise(x/105, time), x, height);
    noStroke();




    x= x + 1;
  }
  time = time + 0.03;
}


