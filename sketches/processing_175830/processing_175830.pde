
void setup()
{
  size(600, 305);
  background (#C60465);
  smooth();
}


void draw()
{
  
  
fill(#C5FF0A);
noStroke();


  for (int deg = 0; deg < 360; deg += 5) {
    for (int i=0;  i<650; i +=100) {
    int radius = 40;
    float angle = radians(deg);


    float x = 300+ (tan(angle) * radius);
    float y = 300+ (cos(angle) * i/2);
    ellipse(x, y, 2, 2);



    float x1 = 300+ (sin(angle) * i/1.1);
    float y1 = 300+ (cos(angle) * i/1.1);
    ellipse(x1, y1, 5, 5);

  }
}
}
