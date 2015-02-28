
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
    
 
    ellipse(i*50+25, a[i], 50, 50);
    ellipse(i*50+25, a[i]-32, 25, 25);
    ellipse(i*50+30, a[i]+15, 12, 18);
    ellipse(i*50+20, a[i]+15, 12, 18);
    ellipse(i*50+30, a[i]-32, 5, 5);
    ellipse(i*50+20, a[i]-32, 5, 5);
    if ( mouseX > i*50 && mouseX < i*50+50 ) 
    
    {
      a[i] = a[i] + random(-5, 5);
    }
    i = i + 1;
  }
}


