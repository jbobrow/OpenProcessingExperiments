
int e=45; // point radius
float b = 2.0; //multiple by PI  b*PI

void setup() {
  size(800, 800);
}
void draw() {


  translate(width/2, height/2);
  for (float j=0;j<300;j=j+e) {
    float a = (kat_dist(e, j));
    println(a);
    for (float i= 0;i<=b*PI+.001;i=i+a) {
      fill(0);
      ellipse(cos(i)*j, sin(i)*j, e, e);
    }
  }
  stop();
}


float kat_dist(float a, float r) {
  float d = b*PI*r;
  float ang =   (b*PI / round(d/a));
  return ang;
}

