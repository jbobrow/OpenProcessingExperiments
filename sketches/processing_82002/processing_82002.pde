
float a = random(100);
float b = a;
float rsum = 0 ;

void draw() {
  String sf = "f" + frameCount + " : ";
  if (a == b + rsum) {
    println(sf + "equal " + a);
    background(0, 255, 0);
  } else {
    println(sf + "NOT EQUAL! " + a + " != " + (b + rsum));
    background(255, 0, 0);
  }
  
  float r = random(10.0);
  a += r;
  rsum += r;
}

