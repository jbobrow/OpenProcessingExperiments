
//Array of Ellipses and Rectangles
int num = 50;
float[] y = new float[num];

void setup() {
  size(300, 300);
  for ( int b = 0; b < y. length; b++) {
    y[b]= random(width);
  }
}
//Background and array for ellipses and rectangles
void draw() {
  background(45,174,211);
  fill(45,211,76);
  rect(0,230,height,width);
  stroke(147, 116, 250);
  fill(116, 250, height);
  smooth();
  //this is for the falling chiclets and gumballs :)
  for (int a = 0; a<y. length; a+=10) {
    for (int b= 0; b<y. length; b+=20) {
      rect((width/ y. length) * a, y[a], 30, 30);
      fill(height, 116, 250);
      ellipse((width/ y. length) * b, y[b], 80, 80);

      y[a] = y[a]+1;
      y[b]= y[b]+1;
      if (y[a] > width) y[a] = 0;
      if (y[b] > width) y[b]=0;
    }
  }
}


