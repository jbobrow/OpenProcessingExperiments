
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Joo Yong Gill
// ID: 201420108

float n = 35; 
float m = 200;

void setup() {
  size (600, 600);
  smooth();
}

void draw() {
  background(255);

  for (int i = 30; i<600; i = i + 60) {
  for (int j = 30; j<600; j = j + 60) {
    fill(#172FFA, 70);
    rectMode(CENTER);
    rect(i, j, n, n);

    if ( n == 100) {
         n = 20;
      }
    }
  }
  n = n+1;

  for (float c = 60; c<600; c = c + 120) {
  for (float d = 60; d<600; d = d + 120) {
      noFill();
      ellipse(c, d, m, m);
        
        if ( m < 35 ) {
        m = 200;
      }
    }
  }
  m = m-1;
}

