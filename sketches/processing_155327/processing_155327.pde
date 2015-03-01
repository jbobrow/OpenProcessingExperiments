
int num=60;
float theta, px, sw;

void setup() {
  size(500, 500);
  strokeCap(SQUARE);
}


void draw() {
  background(#000000);
  float x=100;

  translate(width/2, height/2);
  for (int i=0; i<num; i++) {
    pushMatrix();
    float r = TWO_PI/num*i;
    rotate(r);
    float angle = theta+r;
    if (i%2==0) {
      px = map(sin(angle), -1, 1, x, 200);
      stroke(#751D45);
    } else {
      px = map(sin(angle+PI/2), -1, 1, x, 200); 
      stroke(#3C254A);
    }
    strokeWeight(2);
    line(x-10, 0, px, 0);
    popMatrix();
  }
  theta += 0.0523;
}

