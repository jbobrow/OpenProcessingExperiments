
void setup()
{
  size(640,480);
  smooth();
}
void draw()
{
  background(0);
  int c = 10;
    for (int j = 0; j< height; j= j+20) {
      float a = 0;
      float b = 0.5;
      stroke(j);
      fill(185,70+j,100+j);
        for (int i = 0; i < width; i = i+3) {
          float n = noise (a) * 50.0;
    ellipse(i,n+c, 5- dist(mouseX,mouseY,i,n+c)/10, 2- dist(mouseX,mouseY,i,n+c)/10);
    a=a+b;
  }
  c=c+50;
}}

