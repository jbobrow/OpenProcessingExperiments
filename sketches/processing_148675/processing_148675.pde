
float diameter; 
float angle = 0;

void setup() {
  size(500, 500);
  background(255);
  diameter = 290;
  noStroke();
  frameRate(1000);
}

float R=125;
float centerR=125;
float a=PI/2;
float a1=PI;
float a2=3*PI/2;
float pathR=125;
float pathG=125;
float G=125;
float centerG=125;
float pathB=125;
float B=125;
float centerB=125;


void draw() {
  noStroke();
  fill(255, 40);
  rect(250, 250, width, height);
  pathR=centerR+R*sin(a);
  a=a+.03;
 
  pathG=centerG+G*sin(a1);
  a1=a1+.03;
  
  pathB=centerB+B*sin(a2);
  fill(pathR, pathG, pathB, 25);
  stroke(pathR, pathG, pathB, 150);
  float c = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
  rectMode(CENTER);
  for (int i = 75; i < width-25; i = i + 50) {
    for (int j = 75; j < height-25; j = j + 50) {
      rect(i, j, c, c);
    }
  }
  angle += 0.02;
  filter(BLUR, 1);
}

