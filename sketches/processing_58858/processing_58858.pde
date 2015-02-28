
float theta;
float kaiten;

float color_count;

void setup() {
  size(400, 400);
  background(0);
  smooth();

  colorMode(HSB, 360, 100, 100);

  noStroke();
}

void draw() {  
  background(0);
  translate(width/2, height/2);

  danmaku();
}

void danmaku() {
  for (int i = 0;i <= 150;i++) {
    if (i % 2 == 0) {
      fill(0,0,100,150);
    }
    else {
      fill(200*abs(sin(color_count))+i, 50, 100, 150);
    }
    pushMatrix();
    rotate(kaiten);  
    drawStar(i*1.8*cos(theta), i*1.8*sin(theta), 1.2);
    popMatrix();

    theta++;
    color_count += 0.0001;

    if (theta > 50) {
      theta = 0;
    }
  }
  kaiten += 0.01;
}

void drawStar(float x, float y, float mgn) {
  beginShape();
  vertex(x, y - 20*mgn);
  vertex(x - 12*mgn, y + 15*mgn);
  vertex(x + 18*mgn, y -  8*mgn);
  vertex(x - 18*mgn, y -  8*mgn);
  vertex(x + 12*mgn, y + 15*mgn);
  endShape(CLOSE);
}


