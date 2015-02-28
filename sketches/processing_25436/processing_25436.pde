
void setup() {
  size(255,255);
  background(0);
  frameRate(15);
}
void draw() {
  background(0);
  smooth();
  // Start with i as 0
  int i=254;
  float r=0;
  float g=0;
  float b=0;
  // While i is less than the width of the window
  while(i>0) {
    //noStroke();
    stroke(0);
    float distancer=abs(mouseX-r);
    float distanceg=abs(mouseX-g);
    float distanceb=abs(mouseX-b);
    fill(distancer,distanceg,distanceb);
    ellipseMode(CENTER);
    ellipse(mouseX,mouseY,mouseX-i,mouseY-i);
    // Increase i by 10
    i-=10;
   r+=random(10);
   g+=random(15);
   b+=random(20);
  }
}


