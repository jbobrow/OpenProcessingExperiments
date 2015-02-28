
float[] a;

void setup() {
  size(400, 400);
  stroke(0, 150, 200);
  fill(100, 200, 50);

  a = new float[9];
  int i = 0;
  while ( i <= 8 ) {
    a[i] = 200;
    i = i + 1;
  }
}

void draw() {
  background(0);
  int i = 0;
  while ( i <= 8 ) {

    ellipse(i*50, a[i]-40, 30, 30); 
    ellipse(i*50-5, a[i]-40, 5, 5);
    ellipse(i*50+5, a[i]-40, 5, 5);
    ellipse(i*50, a[i], 50, 50);
    fill(random(0,255));
    ellipse(i*50, a[i], 30, 30);

    // compare the numbers in this if statement with the numbers in
    // the rect() command
    if ( mouseX > i*50 && mouseX < i*50+50 ) {
      a[i] = a[i] + random(-5, 5);
    }
    i = i + 1;
  }
}


