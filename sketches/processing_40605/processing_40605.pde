
float[] circles;
int num = 500;
int [] x = new int[num];
int [] y = new int[num];

void setup () {
  size(800, 800);
  background(0);
  noStroke();
  circles = new float[50];
  for (int i = 0; i < circles.length; i++) {//.length tells you how big the array is, you don't have to change this number; i++ means adding by 1
    circles[i] = 150;
  }
}

  void draw() {
    fill(255, random(5, 100));
    ellipse(random(width), random(height), 5, 5);
    ellipse(random(width), random(height), 5, 5);
    ellipse(random(width), random(height), 5, 5);//specks in background
    for (int i = circles.length-1; i > 0; i--) {
      circles[i] = circles[i-1];
    }

    for (int i = 0; i < circles.length; i++) {
      fill(#710400*i/2, random(1, 100));
      noStroke();
      ellipse(width/2, height/2, mouseX, mouseY);//circles in foreground
    }
    for (int i = x.length-1; i>0; i--) {
      x[i] = x[i-1];
      y[i] = y[i-1];
    }
    x[0]=mouseX;
    y[0]=mouseY;
    for (int i = 0; i<x.length; i++) {
      line(x[i], y[i], width/2, height/2);
    }
    for (int i = x.length-1; i>0; i--) {
      x[i] = x[i-1];
      y[i] = y[i-1];
    }
    x[0]=mouseX;
    y[0]=mouseY;
    for (int i = 0; i<x.length; i++) {
      stroke(#FFF703, 255-20*i);
      line(x[i], y[i], width/2, height/2);//lines in foreground
    }
  }


