
float[] a;

void setup() {
  size(500, 500);



  a = new float[20];
  int i = 0;
  while ( i <= 19 ) {
    a[i] = 250;
    i = i + 1;
  }
}

void draw() {
  background(255);

  int i = 0;
  while ( i <= 19 ) {    
    //ears
    fill(255);
    ellipse(i*50-10, a[i]-10, 20, 20); 
    ellipse(i*50+10, a[i]-10, 20, 20);

    fill(255);
    ellipse(i*50, a[i], 30, 30);

    //eyes
    fill(0);
    ellipse(i*50-7, a[i]-3, 3, 5); 
    ellipse(i*50+7, a[i]-3, 3, 5);

    
    fill(255, 0, 30);
    triangle(i*50-2, a[i], i*50+2, i*50, i*50, i*50+2);

    if ( mouseX > i*50 && mouseX < i*50+50 ) {
      a[i] = a[i] + random(-10, 10);
    }

    i = i + 1;
  }
}



