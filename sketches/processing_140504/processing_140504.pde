
int n=12;
float[] x=new float[n];
float[] y=new float[n];
float rad=60;

void setup() {
  size(600, 600);
  background(255);
  for (int i=0;i<n;i++) {
    x[i]=i*(width+width*2/n)/n-width/n/2;
    y[i]=i*(height+height*2/n)/n-height/n/2;
  }
}
float a=0;
float b=0;
float colorRangemin=80;
float colorRangemax=200;
void draw() {
  if(mousePressed){
  fill(255);
  noStroke();
  rect(0,0,600,600);
  }
  if (mouseX<300) {
    a=map(mouseX, 0, 300, colorRangemax, colorRangemin);
  }
  if (mouseX>300) {
    a=map(mouseX, 300, 600, colorRangemin, colorRangemax);
  }
  if (mouseY<300) {
    b=map(mouseY, 0, 300, colorRangemax, colorRangemin);
  }
  if (mouseY>300) {
    b=map(mouseY, 300, 600, colorRangemin, colorRangemax);
  }

  for (int i=0;i<n;i++) {
    for (int j=0;j<n;j++) {
      noStroke();
      fill(a*b/30,a, b, (a+b)/8);
      ellipse(x[i], y[j], 10, 10);
      if (sqrt((mouseX-x[i])*(mouseX-x[i])+(mouseY-y[j])*(mouseY-y[j]))<rad) {
        stroke(a, random(100, 160), b, (a+b)/2);
        strokeWeight(1);
        line(mouseX, mouseY, x[i], y[j]);
      }
    }
  }
}
