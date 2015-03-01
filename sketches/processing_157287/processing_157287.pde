
float num, pathR, pathG, pathB;
int backgroundColor = 0;
boolean doOnce = true;

void setup() {
  size(640, 640);
}

void draw() {
  background(backgroundColor);
  translate(width/2, height/2);
  for (int i = 0; i < 360; i+=30) {
    float x = sin(radians(i+frameCount)) * 50;
    float y = cos(radians(i+frameCount)) * 50;
    pushMatrix();
    translate(x, y);
    rotate(radians(-i));
    branch(75, i);
    popMatrix();
  }
  num+=0.02;
}


void branch(int l, int i) {
  float theta = sin(num)*90;

  line(0, 0, 0, l);
  translate(0, l);

  l *= 0.66;

  pathR = (((float)255/width)*mouseX+theta)+125*sin(i+num*3);
  pathG = (50+theta)+125*sin(i+num*3);
  pathB = (((float)255/height)*mouseY+theta)+125*sin(i+num*3);

  if (l > 2) {
    stroke(pathR, pathG, pathB);
    pushMatrix();
    rotate(radians(theta));
    branch(l, i);
    popMatrix(); 

    stroke(pathR, pathG, pathB);
    pushMatrix();
    rotate(-radians(theta));
    branch(l, i);
    popMatrix();
  } else {
    noStroke();
    fill(pathR, pathG, pathB);
    ellipse(0, 0, 5, 5);
  }
}

void mousePressed() {
  if (doOnce && backgroundColor == 255) {
    backgroundColor = 0;
    doOnce = false;
  }
  if (doOnce && backgroundColor == 0) {
    backgroundColor = 255;
    doOnce = false;
  }
}

void mouseReleased() {
  doOnce = true;
}



