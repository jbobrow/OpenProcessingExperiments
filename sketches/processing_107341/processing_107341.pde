
float rectX = 0;
float distX;
float easing = 0.25;
float a = 0;

void setup() {
  size(800, 600);
}

void draw() {
  fill(255, 15);
  noStroke();
  rect(0, 0, width, height);

  rectX += (distX - rectX)*easing;
  distX = 0;

  for (int i=0; i<height; i+=11) {
    for (int j = -width; j<width; j+=11) {
      fill(50, 50+i/3,50+i/4);
      float tempP = noise(a);
      a+=0.1;
    //  println(tempP);
      rect(tempP*j+rectX*j/4, i, 7, 7);
     
      if (a>100000) a =0;
    }
  }
}
