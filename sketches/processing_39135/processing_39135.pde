
void setup() {
  size(400, 400);
  colorMode(RGB);
  background(250, 241, 159);
}
void draw() {
  for (int a=20; a<width*2; a+= 120) {
    for (int b=0; b<width*3; b+=100) {
      noStroke();
      fill(600, 940, 345, 75);
      ellipse(a/2, b/2, 50, 50);

      stripe(a, b);


      for (int c=150; c>height/2; c+=255) {
        fill(90, 40, 345, 60);
        stripe(a, b);
      }
    }
  }

  noLoop();
}
void stripe(float a, float c) {
  pushMatrix(); 
  translate(a, c);
  stroke(width, height, 360, 50);
  strokeWeight(8);
  line(-a, -a, a*width, a*height);
  strokeWeight(4);
  line(-a-10, -a-10, a*width, a*height);
  noStroke();
  fill(800, 89, 900, 30);
  ellipse(-10, c/height, 60, 60);
  fill(800, 89, 900, 70);
  ellipse(0, c/height, 50, 50);


  popMatrix();
}


