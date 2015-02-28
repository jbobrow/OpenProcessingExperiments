
float[] a;


void setup () {
  size(800, 200);

  a = new float[15];
  int i = 0;
  while ( i <= 14) {
    a[i] = 25;
    i = i + 1;
  }
}


void draw() {
  background(250, 230, 248);

  int i = 0;
  while (i<= 14) {
    noStroke();
    fill(0);
    //body
    ellipse(i*50, a[i], 50, 50);
    //eyes
    fill(random(0,225));
    ellipse(i*50+10, a[i], 10, 10);
    ellipse(i*50-10, a[i], 10, 10);

    if (mouseX >= i*50 && mouseX <= i*50+50) {
      a[i] = a[i] + random(-5,25);
    }
    i = i +1;
  }
}



