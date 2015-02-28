
  float[] a;

  void setup() {
    size(400,400);

    a = new float[500];
  }
 
  void draw() {
    background(255);
    int i = 0;
    while ( i <= 499 ) {
      line(mouseX+i%3,a[i],500,50);
      fill(0,0,40,10);
      line(mouseX,a[i],200,500);

      a[i] = a[i] + random(-4,8);
      i = i + 1;
    }
   
    
  }


