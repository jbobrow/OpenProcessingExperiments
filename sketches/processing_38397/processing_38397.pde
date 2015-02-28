
//defining variables
float x; //controls bounding lines

void setup () {
  size (500, 500);
  x = random((width-width)+100, width-100); //controls bounding lines
  background(0);
}
void draw() {
  smooth();
  noFill();
  strokeWeight(21);
}

void mousePressed() {
  background(0);
  x = random (100, 400);

  //first set of ellipses
  for (int y=0;y<=1500;y+=40) {
    stroke (random(x), 200, 100);
    ellipse(x, x, y, y);

    //horizontal lines
    for (int a=0;a<=x;a+=20) {
      stroke (100, random(x), 200);
      line(0, a+10, x, a+10);

      //vertical lines
      for (int b=0;b<=x;b+=20) {
        stroke (random(x));
        line(b, x, b, 500);
      }
    }
  }
  
  //framing lines
  stroke(0);
  line (x, 0, x, 500); //vertical bounding
  line (0, x, x, x); //horizontal bounding
}


