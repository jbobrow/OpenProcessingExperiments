
void setup() {

  fill(255);
  size(600, 600);
  strokeWeight(3);

  backEllipses();

  float theta=0.0;
  int counter=1;
  float color2=0;
  while (counter < 9) {
    fill(color2, 255-color2, color2+5, 40);
    ellipse(0, 0, 100*counter, 100*counter);
    color2=color2+25;
    counter=counter+1;
  }
  int counter2=0;
  int color1=0;

  while (counter2<16) {
    fill(255-color1, color1, color1, 30);
    ellipse(0, 0, 100*counter2, 100*counter2);
    rotate(theta);
    ellipse(0, 150, 200, 300);
    //ellipse(0,150,300,600);
    triangle(300, 0, 300, 0, -300, 0);
    rotate(-theta);
    theta = PI/8 + theta;
    rotate(-theta);

    color1=color1+10;
    counter2=counter2+1;
  }

  strokeWeight(.5);
  createTriangles();
}


