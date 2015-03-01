
int[][] points = { {100,100}, {200,150}, {250,100}, {300,150},
{400,100}, {350,200}, {400,250}, {350,300}, {400,400}, {300,350},
{250,400}, {200,350}, {100,400}, {150,300}, {100,250}, {150,200} };

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  fill(150,100,250,100);
  beginShape();
  for (int i = 0; i < points.length; i++) {
    vertex(points[i][0], points[i][1]);
  }
  endShape(CLOSE);
}


