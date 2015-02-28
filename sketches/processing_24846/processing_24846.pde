
final int bgShade =  23;
final int fgShade = 180;

void setup() {
  size(300, 600, P2D);
  smooth();
  background(23);
  
  stroke(180,90);
  
  ellipseMode(CENTER);
  
  randomSeed(2);  // So it is the same everytime
  
  int n=10000;
  pushMatrix();
    translate(0, height/2);
    for(float i=0, t, r; i<n; ++i) {  // Repeat n times, and initializing t(Theta) and r(Radius)
      t = random(-HALF_PI, HALF_PI);
      r = random(0, width);
      r = (r*r) / (width);
      r+= (width/3) *cos(PI*r/width);
      r*= 1.8;
      point(r*cos(t), r*sin(t));
    }
  popMatrix();
}

void draw() { }

