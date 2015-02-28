
int barWidth = 0;
int lastBar = 0;
int[] a=new int[214748];
int[] b=new int[214748];
float[] c=new float[214748];
int z=0;

void setup() {
  size(800, 800);
  noStroke();
  background(0);
  smooth();
}

void draw() {
  if (mousePressed) {
    background(0);
  }
  fill(0);
  ellipse(mouseX, mouseY, 15, 15);
  a[z]=mouseX;
  b[z]=mouseY;

  z++;


  for (int k=0; k<z; k++) {
    c[k]+=1.3;
    fill(255, 0, 0);
    ellipse(a[k], b[k]+c[k], 5/(c[k]/3+1), 5/(c[k]/3+1));
  }
  for (int start=millis(); start+1>millis(); );
}



