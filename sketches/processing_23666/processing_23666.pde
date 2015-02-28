
// a row of circles that can be 
// turned on or off

// this array 
boolean row[] = new boolean[5];

void setup() {
  size(250, 50);
  smooth();
}

void draw() {
  background(128);  
  float w = width / row.length;  
  for (int i=0; i < row.length; i++) {
    float x = w/2 + i*w;
    if (row[i]) {
      fill(0);
    }
    else {
      fill(255);
    }
    ellipse(x, height/2, w, w);
  }
}

void mousePressed() {
  int w = width / row.length;
  int i = mouseX / w;
  row[i] = !row[i];
}

