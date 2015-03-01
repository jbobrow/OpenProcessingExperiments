
float a = 0;
float h = 0;

void setup () {
  size (400, 400, P3D);
  noSmooth();
  colorMode(HSB);
  noStroke();
  background(0);
}

void draw (){
  translate(width/2, height/2);
  rotate(a);
  fill(h, 150, 255);
  for (int i = 0; i <width; i++) {
    pushMatrix();
    rotate(i/TWO_PI);
    translate(0, 0, i*2);
    ellipse(0, i*0.5, 2, 2);
    popMatrix();
  }
  a -= 0.1;
  if (h == 255) {
    h = 0;
  }
  h ++;
}
