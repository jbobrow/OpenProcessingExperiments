
void setup() {
  size(600, 600);
  stroke(0);
  noFill();
  rectMode(CENTER);
  ellipseMode(CENTER);
}

int[] s = {   0, 100, 200, 300, 400, 500 };
int[] c = { 100, 200, 300, 400, 500, 600 };

void draw() {
  
  background(255);
  
  for (int i = 0; i < 6; i++) {
    s[i] = s[i] + 1;
    c[i] = c[i] - 1;
    
    if (c[i] < 0) c[i] = 600;
    if (s[i] > 600) s[i] = 0;
    
    rect   (300, 300, s[i], s[i]);
    ellipse(300, 300, c[i], c[i]);
  }
}

