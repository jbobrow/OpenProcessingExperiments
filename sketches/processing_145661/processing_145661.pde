
int num=60;
float r;
color[] palette = {
  #2D112C, #530031, #820233, #CA293E, #EF4339
};


void setup() {
  size(500, 500);
}

void draw() {
  fill(#000000, 10);
  strokeWeight(5);
  noStroke();
  rect(0, 0, width, height);
  pushMatrix();
  translate(width/2, height/2);
  rotate(r);
  for (int i=0; i<num; i++) {
    pushMatrix();
    rotate(i*(TWO_PI/num));
    stroke(palette[i%palette.length]);
    line(0, 0, width*2, 0);
    popMatrix();
  }
  r += (TWO_PI/(num/palette.length)/num);
  fill(#2D112C);
  noStroke();
  ellipse(0, 0, 80, 80);
  popMatrix();
}

