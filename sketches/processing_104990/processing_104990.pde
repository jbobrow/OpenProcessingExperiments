
void setup() {
  size(800, 600);
  background(85, 3, 150);
  colorMode(RGB, 255);
  noStroke();
}
void draw() {
  for (int i=25;i<height;i+=50) {
    fill(186, 161, 19);
    rect(0, i, width, 10);
  }

  for (int i=25;i<width;i+=50) {
    fill(186, 161, 19);
    rect(i, 0, 10, height);
  }
  for (int i=30;i<height;i+=50)
  {
    for(int j=30;j<width;j+=50)
    {
      fill(251,234,0);
      ellipse(j,i,13,13);
    }
  }
}
