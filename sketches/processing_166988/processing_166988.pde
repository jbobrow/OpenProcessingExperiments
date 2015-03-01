

float a = 0;
float b = 400;

void setup() {
  size(390, 480);
  background(255);

}


void draw() {
a = a+1;
b = b-1;
ellipse(a, 30, 60, 60);
stroke(a,a,b);
ellipse(b, 90, 60, 60);
ellipse(a, 150, 60, 60);
ellipse(b, 210, 60, 60);
ellipse(a, 270, 60, 60);
ellipse(b, 330, 60, 60);
ellipse(a, 390, 60, 60);
ellipse(b, 450, 60, 60);

}





