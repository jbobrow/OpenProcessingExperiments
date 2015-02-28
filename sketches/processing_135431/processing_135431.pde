
float radius = 0;
float angle = 0;
float r = 0.;
float[] b = new float[8];
boolean k0 = false;
boolean k1 = false;
int n = 2;

void setup() {
  size(700, 700);
  background(0);
  for (int i = 0; i<8; i++) {
    b[i]=random(-150, 150);
  }
}

void draw() {
  fill(0, 5);
  rect(0, 0, width, height);
  translate(width/2, height/2);
  rotate(r);
  stroke(255);
  for (int i = 0; i<n; i++) {
    float xcoord = cos(angle*TWO_PI/360)*radius;
    float ycoord = sin(angle*TWO_PI/360)*radius;
    noFill();
    strokeWeight(2);
    bezier(xcoord+b[0], ycoord+b[1], xcoord+b[2], ycoord+b[3], xcoord+b[4], ycoord+b[5], xcoord+b[6], ycoord+b[7]);
    if (k0 == true) {
      b[0]++;
    } 
    else {
      b[0]--;
    }
    if (b[0] > 250 || b[0] < -250) {
      k0=!k0;
    } 
    if (k1 == true) {
      b[1]--;
    } 
    else {
      b[1]++;
    }
    if (b[1] > 250 || b[1] < -250) {
      k1=!k1;
    } 


    radius=map(sin(angle), 1., -1., -150., 150.);
    angle=angle+0.01;
    r=r+.1;
    rotate(TWO_PI/n);

    if (mousePressed) {  // re-initialize array
      for (i = 0; i<8; i++) {
        b[i]=random(-150, 150);
      }
    }
  }
}

