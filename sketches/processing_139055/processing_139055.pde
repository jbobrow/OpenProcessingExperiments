

float[] a;

void setup() {
  size(400, 400);
  stroke(50, 50, 250);
  fill(150, 150, 250);

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

    //body
    fill(#B7B7B7);
    stroke (0);
    rect(i*50+25, a[i], 50, 50);
    //head
    rect(i*50+38, a[i]-23, 25, 25);
    //left eye
    fill(#FF0505);
    stroke (0);
    rect(i*50+42, a[i]-18, 5, 5);
    //right eye
    rect(i*50+54, a[i]-18, 5, 5);
    //right hand
    fill(#B7B7B7);
    stroke (0);
    rect(i*50+73, a[i]+15, 10, 10);
    //left hand
    rect(i*50+17, a[i]+15, 10, 10);
    //right foot
    rect(i*50+60, a[i]+40, 10, 20);
    //left foot
    rect(i*50+30, a[i]+40, 10, 20);
    //belly
    fill(a[i]);
    stroke (0);
    ellipse(i*50+50, a[i]+23, 30, 30);

    if ( mouseX > i*50 && mouseX < i*50+50 ) {
      a[i] = a[i] + random(-5, 5);
    }
    i = i + 2;
  }
}



