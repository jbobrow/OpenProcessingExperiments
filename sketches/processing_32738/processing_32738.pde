
float [] x = new float [30000];
void setup() {
  size(1900,1000);
  smooth();
  noStroke();
 for (int i =0; i< x.length; i++) {
  x[i] = random(-1000,200);
  }
}
  void draw() {
    background(0);
    fill(255,255,130);
    for (int i = 0; i<x.length; i++) {
    x[i] += 50;
    float y=i*0.25;
    arc(x[i], y, 12, 12, 0.52, 5.76);
 
  }
}


  
  



