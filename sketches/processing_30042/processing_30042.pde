
void setup() {
  size(400, 400);
  colorMode(HSB);
  textFont("sans", 15);
}

int mode = 0;
int SHOW_NSQ = 1;
int SHOW_N = 2;

void draw() {
  background(255);

  fill(150, 150, 255);
  stroke(255);
  strokeWeight(3);

  float buff = 20;
  int n = floor(map(mouseX, 0, width, 1, 31));
  float rectSize = (width - buff - buff) / n;
  for (int row = 0; row < n; row++) {
    for (int col = 0; col < n; col++) {
      float x = map(row, 0, n, buff, width-buff);
      float y = map(col, 0, n, buff, height-buff);

      if (col + 1 > n - (row + 1)) {
        rect(x, y, rectSize, rectSize);
      }
    }
  }

  noStroke();
  float alpha = 0.3;
  if (highlightNSQ()) {
    fill(0, 255, 255, alpha*255);

    triangle(buff, height-buff, 
    width-buff, buff, 
    width-buff, height-buff);
  }

  if (highlightN()) {
    fill(100, 255, 255, alpha*255);
    quad(buff, height-buff, 
    width-buff, buff, 
    width-buff-rectSize, buff, 
    buff, height-buff-rectSize);
  }
  
  
  fill(0);
  translate(buff*2, buff*2);
  text("N:", 0, 0);
  text(n, 60, 0);
  translate(0, textAscent() + textDescent());
  text("N/2:", 0, 0);
  text(n * 0.5, 60, 0);
  translate(0, textAscent() + textDescent());
  text("(N*N)/2:", 0, 0);
  text(n * n * 0.5, 60, 0);
  translate(0, textAscent() + textDescent());
  text("Sum:", 0, 0);
  text(sumUpTo(n), 60, 0);
}

int sumUpTo(int n) {
  return round(((n * n) + n) * 0.5);
}

boolean highlightN() {
  return (mode & SHOW_N) > 0;
}
boolean highlightNSQ() {
  return (mode & SHOW_NSQ) > 0;
}

void mouseClicked() {
  mode = (mode + 1) % 4;
}
                                
