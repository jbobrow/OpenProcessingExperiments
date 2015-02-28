
int n = 10;
float[] forward = new float[n];
float[] down = new float[n];
float[] right = new float[n];
color[] c = new color[n];

void setup() {
  size(400, 300, P3D);
  smooth();
  colorMode(HSB, 100);
  stroke(0);
  for (int i=1; i<=n; i++) {
    forward[i-1] = -50*i;   //magicnumber
    down[i-1] = -50*i;      //magicnumber
    c[i-1] = color(i*10, 80, 90);
  }
}
void draw() {
  background(#F5EBF3);
  translate(width/2, height/2+50, 150);
  rotateY(frameCount*.01);
  for (int i=1; i<=n; i++) {
    pushMatrix();
    translate(0, down[i-1], forward[i-1]);
    fill(c[i-1]);
    box(50, 10, 30);
    if (forward[i-1] >= -500) {
      forward[i-1]--;
      down[i-1]--;
    }
    else {
      forward[i-1]=0;
      down[i-1]=0;
    }
    popMatrix();
  }
}



