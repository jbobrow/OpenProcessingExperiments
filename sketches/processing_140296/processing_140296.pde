
int n=10;
float[] x=new float[n];
float[] y=new float[n];
float rad=50;

void setup() {
  size(600, 600);
  background(255);
  for (int i=0;i<n;i++) {
    x[i]=i*width/n+width/n/2;
    y[i]=i*height/n+height/n/2;
  }
}

void draw() {
//  circleForground();
  for (int i=0;i<n;i++) {
    for (int j=0;j<n;j++) {
      ellipse(x[i], y[j], 10, 10);
      if (sqrt((mouseX-x[i])*(mouseX-x[i])+(mouseY-y[j])*(mouseY-y[j]))<rad) {
        stroke(0);
        strokeWeight(0.5);
        line(mouseX,mouseY,x[i],y[j]);
      }
    }
  }
}

/*void circleForground() {
  for (int i=0;i<n;i++) {
    for (int j=0;j<n;j++) {
      ellipse(x[i], y[j], 10, 10);
    }
  }
}
*/

