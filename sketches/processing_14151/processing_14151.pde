
// do two passes of integral image: first vertical, then horizontal
// use padding in integral images to avoid out-of-bounds
// use kernel to lookup in each, then divide by kernel size

void setup() {
  size(512, 512, P2D);
}

void draw() {
  background(128);
  int r = constrain(mouseX, 2, 128);
  int d = 2 * r + 1;
  float rf = (float) d / 2;
  
  scale((float) width / d, (float) width / d);
  
  pushMatrix();
  translate(r, r);
  
  int lastX = -r;
  int lastY = 0;
  
  int i = 0;
  noStroke();
  for(int x = -r; x <= r + 1; x++) {
    float theta = acos((float) x / rf);
    int y = round(sin(theta) * rf - .5);
    if(y != lastY && x != -r) {
      fill(i++ % 2 == 0 ? 255 : 0);
      int w = x - lastX;
      int h = lastY * 2 + 1;
      rect(lastX, -lastY, w, h);
      // spit out rectangular samples here
      //println("x:" + lastX + " y:-" + lastY + " w:" + w + " h:" + h);
      lastX = x;
    }
    lastY = y;
  }
  
  noStroke();
  fill(0, 0, 255);
  rect(0, 0, 1, 1);
  
  stroke(255, 0, 0);
  for(int j = -r; j <= r; j++) {
    line(-r, j, r + 1, j);
    line(j, -r, j, r + 1);
  }
  
  popMatrix();
  
  pushMatrix();
  translate(rf, rf);

  noFill();
  stroke(0, 0, 255);
  beginShape();
  for(int x = -r; x <= r; x++) {
    float theta = acos((float) x / rf);
    float y = (sin(theta) * rf);
    vertex(x, y);
  }
  endShape();
  
  popMatrix();
}

