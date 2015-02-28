
size(800, 800);
background(15,63,165);
//background(82,82,77);
smooth();


fill(173,255,0);
noStroke();

for (int deg = 0; deg < 360; deg += 5) {
  for (int i=0;  i<800; i +=100) {
    int radius = 70;
    float angle = radians(deg);

    float x = 400+ (cos(angle) * radius);
    float y = 400+ (sin(angle) * i/10);
    ellipse(x, y, 4, 4);
    // dot ball

    float x1 = 400+ (cos(angle) * i/1.1);
    float y1 = 400+ (sin(angle) * i/1.1);
    ellipse(x1, y1, 6, 6);
    // ellipse inc

    float radius1 = 80.0;
    for (int deg1 = 0; deg1 < 360*50; deg1 += 11) {
      float angle1 = radians(deg1);
      float x2 = width/2 + (cos(angle1) * radius1);
      float y2 = height/2+ (sin(angle1) * radius1);
      ellipse(x2, y2, 2, 2);
      radius1 = radius1 + 0.34;
    }
    // dot Spiral 
  }
}
