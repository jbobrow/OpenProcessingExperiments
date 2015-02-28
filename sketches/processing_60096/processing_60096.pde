
void setup () {
size(600, 600);
smooth();
background (0);
noStroke();
}

float t = 1;
float m = 30;
color e = color(255, 0, 0);
color k = color(0, 0, 255);

void draw () {
  
  colorMode(RGB, m);
  fill (0);
  rect (0, 0, width, height);
  if (t < m) {
  fill (k, t++);
  rect (0, 0, width, height);
  }
  if (t == m) {
  t = (m * 2) - 1;    
  }
  if (t > m) {
  fill (k, t--);
  rect (0, 0, width, height);
  }
  if (t == m + 1) {
  t = 1;
  }
  if (mouseY < height) {
  fill(color(e));
  ellipse(width/2, height/2, mouseY, mouseY);
  }
  else {
  fill(255,0,0);
  ellipse(width/2, height/2, mouseY, mouseY);
  }
  if (mousePressed) {
  m = 10;
  e = color(255, 0, 0);
  k = e;
  }
  else {
    m = 50;
    e = color(5, 200, 240);
    k = color(0, 0, 255);
  }
}

