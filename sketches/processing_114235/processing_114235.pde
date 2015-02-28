
void setup() {
  size(400, 400);
  background(5);
}


void draw() {
  int a=4;
  int w=3;
  int e=2;
  float r= random(10, 50);
  int mx=mouseX;
  int my=mouseY;


  background(255);
  ellipseMode(CENTER);
  for (int o = 0; o<width; o+=10) {

    for (int p = 0; p<height; p+=10) {
      fill(0);
      stroke(255);
      rect(o, p, 20, 20);

      if (dist(mouseX, mouseY, o, p)<100) {
        ellipse(o, p, 30, 30);

        //bezier(o, p, o, p, o, p);
      }
    }
  }
}



