
size(500, 500);

float x = 0;
float inc = TWO_PI/1000.;

for (int i = 0; i < width; i++) {
  stroke(sin(x)*200.);
  line(i, 0, i, sin(x)*500.);
  x = x+inc;
}

