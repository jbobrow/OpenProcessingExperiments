
int sz = 3;
float x[] = {
};
float y[] = {
};
float dirx[] = {
};
float diry[] = {
};

void setup() {
  size(500, 500);
  background(0);
  noStroke();
  smooth();
}

void draw() {
  fill(0, 15);
  rect(0, 0, width, height);

  if (frameCount % 50 == 0) {
    x = append(x, random(width));
    y = append(y, random(height));
    dirx = append(dirx, random(-1, 1));
    diry = append(diry, random(-1, 1));
  }

  int i = 0;
  while (i<x.length) {
    fill(255);
    ellipse(x[i], y[i], sz, sz);
    x[i] += dirx[i];
    y[i] += diry[i];
    i +=1;
  }
}

