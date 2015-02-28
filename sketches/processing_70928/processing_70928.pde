
size(300, 300);
smooth();

// parameters of polygon
int sides = 7;
int x = 100;
int y = 100;
int polySize = width/4;

beginShape();
for (int i=0;i<=sides;i++) {
  float xx = x + polySize * cos(i*TWO_PI/sides);
  float yy = y + polySize * sin(i*TWO_PI/sides);
  vertex(xx, yy);
}
endShape();


