
void setup()
{
  size(450, 450, P3D);
  background (0);
  smooth();
}


void draw()
{
  float xnoise = 0.0;
  float ynoise = 0.0;
  float inc = 0.85;
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float gray = noise(xnoise, ynoise) * 205;
      stroke(gray-90);
      point(x, y);
      xnoise = xnoise + (inc*2);
    }
}
  
  
  
  
fill(#C5FF0A);
noStroke();


  for (int deg = 0; deg < 360; deg += 5) {
    for (int i=0;  i<650; i +=100) {
    int radius = 40;
    float angle = radians(deg);


    float x = 300+ (tan(angle) * radius);
    float y = 300+ (cos(angle) * i/2);
    ellipse(x, y, 4, 4);



    float x1 = 300+ (sin(angle) * i/1.1);
    float y1 = 300+ (cos(angle) * i/1.1);
    ellipse(x1, y1, 8, 8);


    float radius1 = 100.0;
    for (int deg1 = 0; deg1 < 360*10; deg1 += 5) {
      float angle1 = radians(deg1);
      float x2 = 300 + (sin(angle1) * radius1);
      float y2 = 300 + (tan(angle1) * radius1);
      ellipse(x2, y2, 3, 3);
      radius1 = radius1 + 0.34;
    }

  }
}
}
