

float[] a;

void setup() {
  size(350, 400);
  noStroke();
  smooth();


  a = new float[8];
  int i = 0;
  while ( i <= 7 ) {
    a[i] = 200;
    i = i + 1;
  }
}

void draw() {
  background(255);
  int i = 0;
  while ( i <= 7 ) {

    fill(random(0, 255), random(0, 255), random(0, 255));
    ellipse(i*50, a[i], 50, 50);

    fill(random(0, 255), random(0, 255), random(0, 255));
    ellipse(i*50-10, a[i]-5, 10, 10);

    fill(random(0, 255), random(0, 255), random(0, 255));
    rect(i*50+5, a[i]-10, 10, 10);

    fill(random(0, 255), random(0, 255), random(0, 255));
    rect(i*50-10, a[i]+10, 20, 7);



    if ( mouseX > i*50 && mouseX < i*50+50 ) {
      a[i] = a[i] + random(-5, 5);
    }
    i = i + 1;
  }
}



