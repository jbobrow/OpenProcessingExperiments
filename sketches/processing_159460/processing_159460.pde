
/* Blog design from Jerome Herr */

float num;
boolean doOnce = true, circles = false;
void setup() {
  size(640, 640);
}

void draw() {
  if(!circles){
    fill(255, 50);
    rect(0, 0, width, height);
  }else{
    background(255); 
  }
  float am = map(mouseY, 0, height, 2, 10);
  float s = map(mouseX, 0, width, 50, 290);
  translate(width/2, height/2);
  for (int i = 0; i < 360; i+=am) {
    float x = sin(radians(i+num)) * s;
    float y = x/2 + cos(radians(i+num)) * x;
    float d = map(dist(x, y, 0, 0), 0, 200, -13, 13);

    fill(0);
    ellipse(x, y, d, d);
    ellipse(y, x, d, d);
    ellipse(-x, y, d, d);
    ellipse(-y, x, d, d);

    if (circles) {
      noFill();
      ellipse(x, y, d+d/1.2, d+d/1.2); 
      ellipse(y, x, d+d/1.2, d+d/1.2);
      ellipse(-x, y, d+d/1.2, d+d/1.2);
      ellipse(-y, x, d+d/1.2, d+d/1.2);
    }
  }
  num += 0.5;
}

void mousePressed() {
  if (doOnce && circles) {
    circles = false;
    doOnce = false;
  }
  if (doOnce && !circles) {
    circles = true;
    doOnce = false;
  }
}

void mouseReleased() {
  doOnce = true;
}



