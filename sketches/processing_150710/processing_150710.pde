
int[] angles = { 3, 12, 15, 18, 48, 60, 96, 108 };

void setup() {
  size(800, 360);
  noStroke();
  noLoop(); 
 }


void draw() {
  background(23,235,239);
  pieChart(350, angles);
}

void pieChart(float diameter, int[] data) {
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    float red = map(i, 0, data.length, 0, 255);
    fill(red);
    arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(angles[i]));
    lastAngle += radians(angles[i]);
  }
}


