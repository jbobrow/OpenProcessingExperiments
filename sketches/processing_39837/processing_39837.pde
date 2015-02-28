
int num = 100;
float[] x = new float [num];
float[] y = new float [num];
float[] s = new float [num];
float[] C = new float [num];
color[] myColors = new color [4];
int[] ecol = new int [num];

void setup() {
  size(300, 300);
  //set up random colors
  myColors [0] = color(250, 210, 48, 50);
  myColors [1] = color (170, 3, 9, 50);
  myColors [2] = color (234, 132, 21, 50);
  myColors [3] = color (18, 183, 143, 50);

//seed array
  for (int i=num-1; i>=0; i--) {
    y[i] = random (width, 0);
    s[i] = random (-5, 5);
    ecol[i] = floor(random(0, 4));
    x[i] = random (-50, 50);
    C[i] = random (10);
  }
  stroke(18, 183, 143, 50);
  smooth();
}

void draw() {
  background(52, 37, 10);
  fill(170, 3, 9, 50);
  stroke(18, 183, 143);
  strokeWeight(3);
  arc(0, 300, 350, 350, TWO_PI-PI/2, TWO_PI);

  //sends ellipses across screen on the diagnol
  for (int i=0; i<num-1; i++) {

    if (height/num > 1) {
      strokeWeight(1);
      fill(myColors [ecol[i]]);
      ellipse (y[i], y[i], x[i], x[i]);
      y[i] = y[i] + s [i];
    }
    //feeds two opposite groups of ellipses so the overlap
    else {
      fill(myColors [ecol[i]]);
      ellipse (num, y[i], x[i], x[i]);
      y[i] = y[i] + s [i];
    }
    //loops ellipses 
    if (y[i] > width + abs(x[i]/2)) y[i] = abs(-x[i])/2;
    if (y[i] < -abs(x[i]/2)) y[i] = width - +abs(x[i]/2);
  }
}


