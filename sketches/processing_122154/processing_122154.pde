
int d;
PVector[] stars;
int n= 500;

PVector ns() {
//return new PVector(random(500)-250, random(500)-250, 250);
float q = random(31415) / 5000;
return new PVector(sin(q)*250, cos(q)*250, 256);
}

void setup() {  //setup function called initially, only once

  size(255, 255);
  background(0);  //set background white
//  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  d = 0;
  stars = new PVector[n];
  for(int i=0; i<n; i++) {
    stars[i] = ns();
    stars[i].z = random(255)+10;
   }
}

void draw() {  //draw function loops 
  d++;
  noStroke();
  background(0);  //set background white

  for(int i=0; i<n; i++) {
  PVector s = stars[i];
  fill(255,255,255,255-s.z);
    int x = (s.x / s.z) * 33 + 128;
    int y = (s.y / s.z) * 33 + 128;
    int r = (600 / s.z) + 2;
//    int r = 10;
    ellipse(x,y,r,r);
    s.z = s.z - 1;
    if(s.z < 2) {
      stars[i] = ns();
    }
   }

}
