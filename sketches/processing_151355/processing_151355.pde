
void setup() {
  size(600, 600);
  background(180);
  rectMode(CENTER);
  noStroke();
}

void draw() {
  background(180);
  noStroke();

  int num = 5;
  int margin = 80;

  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);
  for (int i=0;i<num;i++) {
    for (int j=0;j<num;j++) {
      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
      boolean useACircle=(i+j*num)%2==0;
      movingCircle(tx, ty, cellsize, (1-2*int(useACircle))*radians(frameCount), useACircle);
    }
  }
}

void movingCircle(float x, float y, float size, float angle, boolean useCircle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  stroke(0);
  strokeWeight(1);
  fill(140, 180);
  if (useCircle)ellipse(x, y, size, size); // circle
  else rect(x, y, size, size); // square

    stroke(255, 0, 0);
  line(x, y, tempX, tempY); // red line
}



