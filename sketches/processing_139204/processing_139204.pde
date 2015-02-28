
float[] a;
 
 
void setup() {
  size(600, 400);
 
  a = new float[8];
  int i = 0;
  while ( i <= 11 ) {
    a[i] = 200;
    i = i + 1;
  }
   
}
 
void draw() {
  background(217,241,247);
  int i = 0;
  while ( i <= 11 ) {
     
    fill(227,185,219);
    noStroke ();
    ellipse(i*50+25, a[i], 50, 50);
    ellipse(i*50+25, a[i]-40, 25, 25);
    //eyes
    fill(random(200,300));
    ellipse(i*50+30, a[i]-42, 5, 5);
    ellipse(i*50+20, a[i]-42, 5, 5);
    if ( mouseX > i*50 && mouseX < i*50+50 )
     
    {
      a[i] = a[i] + random(-5, 20);
    }
    i = i + 1;
  }
}



