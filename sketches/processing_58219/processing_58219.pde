
float X;
float Y;
float siz = 10;
float st = 2;
void setup() {
  size(500, 500, P2D);
  colorMode(HSB);
  strokeWeight(siz);
  fill(0);
  textSize(20);
}
void draw() {
  background(0);
  for(int w = 0; w < int(width / siz); w++) {
    for(int h = 0; h < int(height / siz); h++) {
      stroke(dist(w * siz, h * siz, X, Y) / st, 255, 255);
      point(w * siz, h * siz);
    }
  }
  X += 0.1 * (mouseX - X);
  Y += 0.1 * (mouseY - Y);
  if(keyPressed) {
    if(key == 'w') {
      siz += 0.1;
    }else if(key == 's') {
      siz -= 0.1;
    }else if(key == 'a') {
      st -= 0.05;
    }else if(key == 'd') {
      st += 0.05;
    }
  }
  if(siz > 10)
    siz = 10;
  if(st < 0)
    st = 0;
  text("Pixel size " + siz, 10, 25);
  text("Scale " + st, 10, 50);
}

