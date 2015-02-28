
/*
 By Joan Soler-Adillon
 www.joan.cat
 processing.joan.cat
 @jsoleradillon
*/

float m[] = new float[400];
float yoff = 0;
float yincrement = 0.005;
float noiseVar = 1;


void setup() {
  size(400, 300);

  for (int i=0;i<400;i++) {
    m[i] = noise(yoff)*height;
    yoff += yincrement;
  }
}

void draw() {
  background(255);

  if (mousePressed) {
    yincrement = map(mouseY, height, 0, 0.0001, 0.05);
    println(yincrement);
  }


  for (int i=0;i<400;i++) {
    line(i, m[i], i, height);
  }

  for (int i=0;i<399;i++) {
    m[i] = m[i+1];
  }

  m[399] = noise(yoff)*height;
  yoff += yincrement;
}



