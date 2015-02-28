
int n=1500;
float [] cx=new float[n];
float [] cy=new float[n];
float theta=0;
void setup() {

  size(700, 700);
  background(0);
  for (int i=0;i<n;i++) {
    cx[i]=random(width+100);
    cy[i]=random(height);
    smooth();
  }
}

void draw() {
  theta+=0.1;
  strokeWeight(.01);
  for (int i=1;i<n;i++) {
    stroke(200);
    cy[i]+=(sin(TWO_PI*noise(0.01*cx[i], 0.01*cy[i])));
    cx[i]+=(cos(TWO_PI*noise(0.01*cx[i], 0.01*cy[i])));
    point(cx[i], cy[i]);
  }

  if (frameCount>250) {
    frameCount=0;
    for (int i=0;i<n;i++) {
      cx[i]=random(width+100);
      cy[i]=random(height+100);
    }
  }
}



