
void setup() {
  size(400,400);
  background(255);

  smooth();
}

float c = 0;
float r = 0;
float t = 0;

void draw() {
  colorMode(HSB, 360, 100, 100);  

  float x, y;

  t += 0.05;
  r += 0.1;

  for (c=0; c<30;c++) {
    fill(c*10, 100, 100, 10-r);
    noStroke();

    if (r > 15) { 
      r = 0;
    }
    x = r * c * cos(t);
    y = r * c * sin(t);

    ellipse(x*10+width/2, y*10+height/2, 30, 30);
  }
}


