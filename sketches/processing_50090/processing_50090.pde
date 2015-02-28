
float angle = 0.0;
int colorR = 200;
int colorB = 200;
int colorY = 200;
float x = 0.0;
float y = 0.0;
float easing = 0.05;

void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  fill(255, 10);
  rect(0,0, 600,600);
  float targetX = mouseX;
  float targetY = mouseY;
  
  x+= (targetX -x) * easing;
  y+= (targetY -y) * easing;
  
  translate(x, y);
  
  colorR += random(-2, 3);
  colorB += random(-2, 3);
  colorY += random(-2, 3);
  
  for (int i=0; i<width; i+=12) {
    for (int j=0; j<height; j+=12) {
      rotate(angle);
      noStroke();
      //fill(colorB, colorR, colorY, 100);
      fill(0, 0, colorY, 80);
      ellipse(i, j, 3, 3);
      angle += .1;
    }
  }
   for (int i=0; i<width; i+=12) {
    for (int j=0; j<height; j+=12) {
      rotate(angle);
      noStroke();
      //fill(colorY, colorB, colorR, 100);
      fill(0, colorB, 0, 80);
      ellipse(i, j, 3, 3);
      angle += .1;
    }
  }
   for (int i=0; i<width; i+=12) {
    for (int j=0; j<height; j+=12) {
      rotate(angle);
      noStroke();
      //fill(colorR, colorY, colorB, 100);
      fill(colorR, 0, 0, 80);
      ellipse(i, j, 3, 3);
      angle += .1;
    }
  }
}

