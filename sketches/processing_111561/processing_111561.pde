
void setup() {
  background(0);
  size (1000, 500);
  smooth();
  stroke(200);
  strokeWeight(40);
  frameRate(100);
}

float n = 0;
float m = 0;

void draw() {
  
    fill(0, 5);
    rect(0, 0, 1000, 500);
  
  /*
  point(500, 250);
   point(250, 250);
   point(750, 250);
   */
  point(500*sqrt(2)*cos(n)/(pow(sin(n), 2)+1)/2+500, 500*sqrt(2)*cos(n)*sin(n)/(pow(sin(n), 2)+1)/2+250);
  //line(500, 250, 500*sqrt(2)*cos(n)/(pow(sin(n), 2)+1)/2+500, 500*sqrt(2)*cos(n)*sin(n)/(pow(sin(n), 2)+1)/2+250);
  n = n+0.005;
  m++;
}



