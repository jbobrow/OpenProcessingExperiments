
float px=0;
void setup() {
  size(600, 400);
}
void draw()
{
  px++;
  if (px<100) {
    rect(20, 20, 20, 20);
  }
  else {
    ellipse(20, 20, 20, 20);
  }
}
