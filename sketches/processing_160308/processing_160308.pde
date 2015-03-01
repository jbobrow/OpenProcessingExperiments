
float theta,sz;
int num = 500, min=5, max=15;

void setup() {
  size(500, 500);
}


void draw() {

  fill(0,10);
  rect(0,0,width, height);
  stroke(255,100);
  fill(255);

  noStroke();
  for (int i=0; i<num; i++) {

    float offSet = PI/num*i;
    float y = map(sin(theta+offSet*2), -1, 1, height*.2, height*.8);
    float x = map(sin(theta+offSet), -1, 1, width*.2, width*.8);
    float sz = map(sin(theta*1+offSet*4), -1, 1, min, max);

    ellipse(x, y, sz*1.5, sz);
  }
  filter(BLUR);
  theta += 0.0523/2;
  
}

