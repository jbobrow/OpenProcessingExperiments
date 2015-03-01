
int frames = 235, num=30;
float theta;

void setup() {
  size(750, 750);
  rectMode(CENTER);
}

void draw() {
  background(20);
  noFill();
  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    pushMatrix();
    float offSet=TWO_PI/num*i;
    rotate(offSet);
    float sz = map(sin(theta), -1, 1, width*.15, width*.2);
    float x = map(sin(theta), -1, 1, sz, width*.2);
    translate(x, 0);
    pushMatrix();
    rotate(theta);
      stroke(200);
    if (i%2==0) {
      ellipse(0, 0, sz, sz*2);
      float px = cos(theta)*sz/2;
      float py = sin(theta)*sz;
      float sz2 = 20;
      strokeWeight(2);
      ellipse(px, py, sz2, sz2);
      strokeWeight(1);
    } else {
      fill(255,20);
      noStroke();
      ellipse(0, 0, sz*.7, sz*2*.7);
      float px = cos(theta+PI)*sz*.35;
      float py = sin(theta+PI)*sz*.7;
      float sz2 = 5;
      fill(255);
      ellipse(px, py, sz2, sz2);
      noFill();
    }
    popMatrix();
    popMatrix();
  }
  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

