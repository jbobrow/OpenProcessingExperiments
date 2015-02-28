
float x;
float easing = 0.04;

void setup () {
size (500,200);
smooth ();
}

void draw () {
  float targetX = mouseX;
  x += (targetX-x) * easing;
  
noStroke();
fill (65,66,66);
ellipse (x + 81, 184, 23, 20);
ellipse (x + 168, 184, 23, 20);


fill (75,142,129);
rect (x + 66, 45, 15, 15);
fill (75,142,129);
rect (x + 170, 45, 15, 15);
fill (92,188,171);
rect (x + 66, 60, 120, 120);

fill (65,66,66);
rect (x + 41, 61, 50, 4);
rect (x + 158, 67, 24, 4);
rect (x + 118, 116, 24, 4);

fill (75,142,129);
rect (x + 95, 127, 54, 54);

fill (227,229,211);
ellipse (x + 81, 100, 58, 48);
fill (65,66,66);
ellipse (x + 93, 96, 23, 20);
fill (227,229,211);
ellipse (x + 154, 94, 29, 39);
fill (65,66,66);
ellipse (x + 155, 99, 15, 15);

}


