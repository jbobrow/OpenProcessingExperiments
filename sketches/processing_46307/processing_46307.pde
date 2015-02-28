
void setup() {
  size(400, 400);
  background(255);
  smooth();
}

float t = 0;
int r = 30;
float k = 0;

void draw() {
  background(0);

  strokeWeight(4);
  for (int i = 0;i < 40;i++) {
    stroke(255, 0, 0,100);
    ellipse(100*sin(t+i)+width/2, 100*cos(t+i)+height/2, r, r);

    stroke(0, 0, 255,100);
    ellipse(160*cos(t+i+k)+width/2, 160*cos(t+i)+height/2, r, r);

    stroke(0, 255, 0,200);
    ellipse(160*sin(t+i-1.1*k)+width/2, 160*sin(t+i)+height/2, r, r);

    k+= 0.001;
    t++;
  }
}


