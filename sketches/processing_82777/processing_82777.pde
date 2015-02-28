
size (400, 400);
background (0);
smooth();
strokeWeight(0.5);
float radius = 0.15;
float cx = 170;
float cy = 185;
float px = cx;
float py = cy;
for (int deg = 0; deg < 360*5; deg +=14) {
  float angle = radians(deg);
  float x = cx + (cos(angle) * radius);
  float y = cy + (sin(angle) * radius);
  
  for (int i=-2; i<2; i+=0.25) {
    ellipse (x*i, y*i, i*8, i*8);
    }
  
  radius = radius * 1.095;
  fill(50, px, py, 190);
  px = x;
  py = y;
}
